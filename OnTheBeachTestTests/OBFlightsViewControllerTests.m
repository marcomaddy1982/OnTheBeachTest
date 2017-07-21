//
//  OBFlightsViewControllerTests.m
//  OnTheBeachTest
//
//  Created by MacBook Pro Retina on 07/02/17.
//  Copyright © 2017 OnTheBeach. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "OBFlightsViewController.h"

@interface OBFlightsViewControllerTests : XCTestCase {

    OBFlightsViewController *flightsViewController;
    
}

@end

@implementation OBFlightsViewControllerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    flightsViewController = [storyboard instantiateViewControllerWithIdentifier:@"OBFlightsViewController"];
    [flightsViewController performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

#pragma mark - View loading tests
-(void)testViewLoads
{
    XCTAssertNotNil(flightsViewController.view, @"View not initiated properly");
}

-(void)testTableViewLoads
{
    XCTAssertNotNil(flightsViewController.tableFlights, @"TableView not initiated");
}

#pragma mark - UITableView tests
- (void)testViewConformsToUITableViewDataSource
{
    XCTAssertTrue([flightsViewController conformsToProtocol:@protocol(UITableViewDataSource)], @"View does not conform to UITableView datasource protocol");
}

- (void)testTableViewHasDataSource
{
    XCTAssertNotNil(flightsViewController.tableFlights.dataSource, @"Table datasource cannot be nil");
}

- (void)testViewConformsToUITableViewDelegate
{
    XCTAssertTrue([flightsViewController conformsToProtocol:@protocol(UITableViewDelegate) ], @"View does not conform to UITableView delegate protocol");
}

- (void)testTableViewIsConnectedToDelegate
{
    XCTAssertNotNil(flightsViewController.tableFlights.delegate, @"Table delegate cannot be nil");
}

@end
