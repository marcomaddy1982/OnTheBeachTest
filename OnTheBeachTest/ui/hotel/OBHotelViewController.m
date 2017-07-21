//
//  OBHotelViewController.m
//  OnTheBeachTest
//
//  Created by MacBook Pro Retina on 06/02/17.
//  Copyright © 2017 OnTheBeach. All rights reserved.
//

#import "OBHotelViewController.h"
#import "OBConnectivityManager.h"
#import "MBProgressHUD.h"
#import "OBFacade.h"
#import "OBHotelViewModel.h"
#import "UIAlertController+Window.h"
#import "OBHotelImageViewCell.h"
#import "UIImageView+AFNetworking.h"

@interface OBHotelViewController () <UICollectionViewDataSource,UICollectionViewDelegate>  {
    OBHotelViewModel *_hotelViewModel;
}

@end

@implementation OBHotelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self startGetHotel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {

    _hotelViewModel = nil;
}

#pragma mark - private implementation

- (void)startGetHotel {

    void(^requestBlock)() = ^()
    {
        __block MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        
        [OBFacade getHotelWithSuccess:^(id object) {
            
            _hotelViewModel = (OBHotelViewModel *)object;
            
            dispatch_async(dispatch_get_main_queue(),^{
                
                [hud hide:YES];
                
                [self setUpLayout];
                
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
                                          [self startGetHotel];
                                      }];
        
        [alert addAction:retryButton];
        
        [alert show];
    };
    
    
    [OBConnectivityManager executeBlockIfConnectionIsAvailable:requestBlock errorBlock:unReachableBlock];


}

- (void)setUpLayout {

    [_collectionImages reloadData];

    [_labelTitle setText:_hotelViewModel.nameText];
    [_labelLocation setText:_hotelViewModel.locationText];
    [_labelDescription setText:_hotelViewModel.descrText];
    [_labelRating setText:_hotelViewModel.ratingText];
    [_labelFacilities setText:_hotelViewModel.facilitiesText];
    
}

#pragma mark - Collection View Delegate Call Back
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _hotelViewModel.imageURLs.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(_collectionImages.frame.size.width,_collectionImages.frame.size.height);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    OBHotelImageViewCell *cell = (OBHotelImageViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"OBHotelImageViewCell" forIndexPath:indexPath];
    
    [cell.imgViewHotel setImageWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_hotelViewModel.imageURLs[indexPath.row]]] placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        
        [cell.indicatorLoading stopAnimating];
        [cell.imgViewHotel setImage:image];
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        
        [cell.indicatorLoading stopAnimating];
    }];

    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(.0f, .0f, .0f, .0f);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0.0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0.0;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
