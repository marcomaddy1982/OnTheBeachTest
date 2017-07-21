//
//  OBFlightsViewController.m
//  OnTheBeachTest
//
//  Created by MacBook Pro Retina on 03/02/17.
//  Copyright © 2017 OnTheBeach. All rights reserved.
//

#import "OBFlightsViewController.h"
#import "OBConnectivityManager.h"
#import "MBProgressHUD.h"
#import "OBFacade.h"
#import "OBFlightViewModel.h"
#import "OBFlightViewCell.h"
#import "UIAlertController+Window.h"

@interface OBFlightsViewController ()<UITableViewDataSource,UITableViewDelegate>{

    NSArray             *_flights;
    UIRefreshControl    *_refreshControl;
}

@end

@implementation OBFlightsViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        _flights = [NSArray array];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addRefreshControl];
    
    [self startGetFlights];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {

    _refreshControl = nil;
    _flights        = nil;
}

#pragma mark - private implementation

- (void)startGetFlights {
    
    void(^requestBlock)() = ^()
    {
        __block MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        
        [OBFacade getFlightsWithSuccess:^(id object) {
            
            _flights = (NSArray *)object;
            
            dispatch_async(dispatch_get_main_queue(),^{
                
                [hud hide:YES];
                
                [_refreshControl endRefreshing];
                
                [_tableFlights reloadData];
                
            });
            
        } failure:^(NSError *error) {
            
            dispatch_async(dispatch_get_main_queue(),^{
                
                [hud hide:YES];
                
                UIAlertController * alert=   [UIAlertController alertControllerWithTitle:kAlert_Attention_Title
                                                                                 message:kAlert_ServiceNotAbailable_Message
                                                                          preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction* retryButton = [UIAlertAction actionWithTitle:kAlert_Common_Button_Cancel
                                                                      style:UIAlertActionStyleDefault
                                                                    handler:nil];
                
                [alert addAction:retryButton];
                
                [alert show];
                
            });
            
        }];
    };
    
    void(^unReachableBlock)() = ^()
    {
        UIAlertController * alert=   [UIAlertController alertControllerWithTitle:kAlert_Attention_Title
                                                                         message:kAlert_ConnectionLost_Message
                                                                  preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* retryButton = [UIAlertAction actionWithTitle:kAlert_Common_Button_Retry
                                                              style:UIAlertActionStyleDefault
                                                            handler:^(UIAlertAction * action)
                                      {
                                          [self startGetFlights];
                                      }];
        
        [alert addAction:retryButton];
        
        [alert show];
    };

    
    [OBConnectivityManager executeBlockIfConnectionIsAvailable:requestBlock errorBlock:unReachableBlock];
}

- (void)addRefreshControl {
    
    if (!_refreshControl)
    {
        _refreshControl = [[UIRefreshControl alloc]init];
        [_tableFlights addSubview:_refreshControl];
        [_refreshControl addTarget:self action:@selector(startGetFlights) forControlEvents:UIControlEventValueChanged];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _flights.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    OBFlightViewCell *cell = (OBFlightViewCell *)[tableView dequeueReusableCellWithIdentifier:@"OBFlightViewCell" forIndexPath:indexPath];
    OBFlightViewModel *flightViewModel = _flights[indexPath.row];
    [cell.labelAirline setText:flightViewModel.airlineText];
    [cell.labelPrice setText:flightViewModel.priceText];
    [cell.labelArrivalInfo setText:flightViewModel.arrivalText];
    [cell.labelDepartureInfo setText:flightViewModel.departureText];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return kOBFlightViewControllerRowHeight;
}

@end
