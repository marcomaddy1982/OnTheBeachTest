//
//  OBHotelViewControllerUITests.m
//  OnTheBeachTest
//
//  Created by MacBook Pro Retina on 07/02/17.
//  Copyright © 2017 OnTheBeach. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface OBHotelViewControllerUITests : XCTestCase {

    XCUIApplication *application;
}

@end

@implementation OBHotelViewControllerUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    application = [[XCUIApplication alloc] init];
    [application launch];

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testViewElementLabel {
    
    [application.tabBars.buttons[@"Hotels"] tap];
    
    XCTAssertEqualObjects([[[application staticTexts] elementBoundByIndex:0] label], @"Labranda Isla Bonita Hotel");
    XCTAssertEqualObjects([[[application staticTexts] elementBoundByIndex:1] label], @"Location: Costa Adeje, Tenerife, Canaries");
    XCTAssertEqualObjects([[[application staticTexts] elementBoundByIndex:3] label], @"Rating: 4");
    XCTAssertEqualObjects([[[application staticTexts] elementBoundByIndex:4] label], @"Facilities: 24 Hour Reception, Aerobics, Air Conditioning.");
}



@end
