//
//  OBHotelTestd.m
//  OnTheBeachTest
//
//  Created by MacBook Pro Retina on 07/02/17.
//  Copyright © 2017 OnTheBeach. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "OBHotel.h"
#import "OBHotelViewModel.h"

@interface OBHotelTests : XCTestCase

@end

@implementation OBHotelTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testHoteltViewModel {

    OBHotel *hotel = [[OBHotel alloc] init];
    hotel.name = @"Labranda Isla Bonita Hotel";
    hotel.location = @"Costa Adeje, Tenerife, Canaries";
    hotel.descr = @"On the Beach Offer - Save up to 15 Book this hotel by 31.10.2016, for travel between 01.11.2016 and 30.04.2017. Offer applicable to all room types on any board basis.";
    hotel.imageURLs = [NSArray arrayWithObjects:@"https://i.onthebeach.co.uk/v1/hotel_images/1ba1aa1c-17e4-4717-afe7-f2b2ea877b87/cover/374/296/high/1.0/labranda-isla-bonita-hotel.jpeg",@"https://i.onthebeach.co.uk/v1/hotel_images/73f82009-b0f5-43b6-9eee-cb0fb25f459a/cover/374/296/high/1.0/labranda-isla-bonita-hotel.jpeg",@"https://i.onthebeach.co.uk/v1/hotel_images/d26659fb-e513-4fbf-9fed-2c24583ad4f0/cover/374/296/high/1.0/labranda-isla-bonita-hotel.jpeg",nil];
    hotel.rating = 4;
    hotel.facilities = [NSArray arrayWithObjects:@"24 Hour Reception",@"Aerobics",@"Air Conditioning",nil];
    
    OBHotelViewModel *hotelModelView = [[OBHotelViewModel alloc] initWithHotel:hotel];
    
    XCTAssertEqualObjects(hotelModelView.nameText, @"Labranda Isla Bonita Hotel");
    XCTAssertEqualObjects(hotelModelView.locationText, @"Location: Costa Adeje, Tenerife, Canaries");
    XCTAssertEqualObjects(hotelModelView.descrText, @"Description: On the Beach Offer - Save up to 15 Book this hotel by 31.10.2016, for travel between 01.11.2016 and 30.04.2017. Offer applicable to all room types on any board basis.");
    XCTAssertTrue(hotelModelView.imageURLs.count == 3);
    XCTAssertEqualObjects(hotelModelView.imageURLs[0], @"https://i.onthebeach.co.uk/v1/hotel_images/1ba1aa1c-17e4-4717-afe7-f2b2ea877b87/cover/374/296/high/1.0/labranda-isla-bonita-hotel.jpeg");
    XCTAssertEqualObjects(hotelModelView.imageURLs[1], @"https://i.onthebeach.co.uk/v1/hotel_images/73f82009-b0f5-43b6-9eee-cb0fb25f459a/cover/374/296/high/1.0/labranda-isla-bonita-hotel.jpeg");
    XCTAssertEqualObjects(hotelModelView.imageURLs[2], @"https://i.onthebeach.co.uk/v1/hotel_images/d26659fb-e513-4fbf-9fed-2c24583ad4f0/cover/374/296/high/1.0/labranda-isla-bonita-hotel.jpeg");
    XCTAssertEqualObjects(hotelModelView.ratingText, @"Rating: 4");
    XCTAssertEqualObjects(hotelModelView.facilitiesText, @"Facilities: 24 Hour Reception, Aerobics, Air Conditioning.");
}

- (void)testHoteltViewModelEmptyField {

    OBHotel *hotel = [[OBHotel alloc] init];
    hotel.name = @"";
    hotel.location = @"";
    hotel.descr = @"";
    hotel.imageURLs = nil;
    hotel.rating = 0;
    hotel.facilities = nil;
    
    OBHotelViewModel *hotelModelView = [[OBHotelViewModel alloc] initWithHotel:hotel];
    
    XCTAssertEqualObjects(hotelModelView.nameText, @"");
    XCTAssertEqualObjects(hotelModelView.locationText, @"No Location.");
    XCTAssertEqualObjects(hotelModelView.descrText, @"No Description.");
    XCTAssertTrue(hotelModelView.imageURLs.count == 0);
    XCTAssertEqualObjects(hotelModelView.ratingText, @"No Rating.");
    XCTAssertEqualObjects(hotelModelView.facilitiesText, @"No Facilities.");
}



@end
