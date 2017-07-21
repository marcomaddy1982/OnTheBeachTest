//
//  OBFlightViewControllerUITests.m
//  OnTheBeachTest
//
//  Created by MacBook Pro Retina on 07/02/17.
//  Copyright © 2017 OnTheBeach. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface OBFlightViewControllerUITests : XCTestCase{
    
    XCUIApplication *application;
}


@end

@implementation OBFlightViewControllerUITests

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

- (void)testTableViewElementNumber {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    XCUIElementQuery *cells = application.tables.cells;
    
    XCTAssertEqual(cells.count, 18, "found instead: \(cells.debugDescription)");
    
}

- (void)testTableViewAnElementCellLabel {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    XCUIElementQuery *cells = application.tables.cells;
    XCUIElement *firstCell = [cells elementBoundByIndex:0];
    
    XCTAssertEqualObjects([[[firstCell staticTexts] elementBoundByIndex:0] label], @"FastJet");
    XCTAssertEqualObjects([[[firstCell staticTexts] elementBoundByIndex:4] label], @"2016-20-10 11:00:00 - Barcelona");
    XCTAssertEqualObjects([[[firstCell staticTexts] elementBoundByIndex:2] label], @"2016-20-10 10:00:00 - London Gatwick");
    XCTAssertEqualObjects([[[firstCell staticTexts] elementBoundByIndex:5] label], @"$12,300.00");
}


@end
