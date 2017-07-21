//
//  OBHotelViewController.m
//  OnTheBeachTest
//
//  Created by MacBook Pro Retina on 07/02/17.
//  Copyright © 2017 OnTheBeach. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "OBHotelViewController.h"

@interface OBHotelViewControllerTests : XCTestCase {
    
    OBHotelViewController *hotelViewController;

}
@end

@implementation OBHotelViewControllerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    hotelViewController = [storyboard instantiateViewControllerWithIdentifier:@"OBHotelViewController"];
    [hotelViewController performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

#pragma mark - View loading tests
-(void)testViewLoads
{
    XCTAssertNotNil(hotelViewController.view, @"View not initiated properly");
}

-(void)testCollectionImageViewLoads
{
    XCTAssertNotNil(hotelViewController.collectionImages, @"CollectionImage not initiated");
}

-(void)testLabelTitleViewLoads
{
    XCTAssertNotNil(hotelViewController.labelTitle, @"LabelTitle not initiated");
}

-(void)testLabelLocationViewLoads
{
    XCTAssertNotNil(hotelViewController.labelLocation, @"LabelLocation not initiated");
}

-(void)testLabelDescriptionViewLoads
{
    XCTAssertNotNil(hotelViewController.labelDescription, @"LabelDescription not initiated");
}

-(void)testLabelRatingViewLoads
{
    XCTAssertNotNil(hotelViewController.labelRating, @"LabelRating not initiated");
}

-(void)testLabelFacilitiesViewLoads
{
    XCTAssertNotNil(hotelViewController.labelFacilities, @"LabelFacilities not initiated");
}

#pragma mark - UICollectionView tests
- (void)testViewConformsToUICollectionViewDataSource
{
    XCTAssertTrue([hotelViewController conformsToProtocol:@protocol(UICollectionViewDataSource) ], @"View does not conform to UICollectionView datasource protocol");
}

- (void)testCollectionViewHasDataSource
{
    XCTAssertNotNil(hotelViewController.collectionImages.dataSource, @"Collection datasource cannot be nil");
}

- (void)testViewConformsToUICollectionViewDelegate
{
    XCTAssertTrue([hotelViewController conformsToProtocol:@protocol(UICollectionViewDelegate) ], @"View does not conform to UITableView delegate protocol");
}

- (void)testCollectionViewIsConnectedToDelegate
{
    XCTAssertNotNil(hotelViewController.collectionImages.delegate, @"Collection delegate cannot be nil");
}

@end
