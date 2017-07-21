//
//  OBFlightTest.m
//  OnTheBeachTest
//
//  Created by MacBook Pro Retina on 07/02/17.
//  Copyright © 2017 OnTheBeach. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "OBFlight.h"
#import "OBFlightViewModel.h"

@interface OBFlightTests : XCTestCase

@end

@implementation OBFlightTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testFlightViewModel{

    OBFlight *flight = [[OBFlight alloc] init];
    flight.airline = @"FastJet";
    flight.departureDate = @"2016-10-20T10:00:00Z";
    flight.arrivalDate = @"2016-10-20T11:00:00Z";
    flight.price = 12300;
    flight.departureAirport = @"London Gatwick";
    flight.arrivalAirport = @"Barcelona";
    
    OBFlightViewModel *flightModel = [[OBFlightViewModel alloc] initWithFlight:flight];
    
    XCTAssertEqualObjects(flightModel.airlineText, @"FastJet");
    XCTAssertEqualObjects(flightModel.priceText, @"$12,300.00");
    XCTAssertEqualObjects(flightModel.arrivalText, @"2016-20-10 11:00:00 - Barcelona");
    XCTAssertEqualObjects(flightModel.departureText, @"2016-20-10 10:00:00 - London Gatwick");

}

- (void)testFlightViewModelEmptyFileds{
    
    OBFlight *flight = [[OBFlight alloc] init];
    flight.airline = @"";
    flight.departureDate = @"";
    flight.arrivalDate = @"";
    flight.price = 0;
    flight.departureAirport = @"";
    flight.arrivalAirport = @"";
    
    OBFlightViewModel *flightModel = [[OBFlightViewModel alloc] initWithFlight:flight];
    
    XCTAssertEqualObjects(flightModel.airlineText, @"");
    XCTAssertEqualObjects(flightModel.priceText, @"$0.00");
    XCTAssertEqualObjects(flightModel.arrivalText, @"");
    XCTAssertEqualObjects(flightModel.departureText, @"");
}

- (void)testFlightViewModelEmptyDates{
    
    OBFlight *flight = [[OBFlight alloc] init];
    flight.airline = @"FastJet";
    flight.departureDate = @"";
    flight.arrivalDate = @"";
    flight.price = 12300;
    flight.departureAirport = @"London Gatwick";
    flight.arrivalAirport = @"Barcelona";
    
    OBFlightViewModel *flightModel = [[OBFlightViewModel alloc] initWithFlight:flight];
    
    XCTAssertEqualObjects(flightModel.airlineText, @"FastJet");
    XCTAssertEqualObjects(flightModel.priceText, @"$12,300.00");
    XCTAssertEqualObjects(flightModel.arrivalText, @"Barcelona");
    XCTAssertEqualObjects(flightModel.departureText, @"London Gatwick");
}

- (void)testFlightViewModelEmptyAirpots{
    
    OBFlight *flight = [[OBFlight alloc] init];
    flight.airline = @"FastJet";
    flight.departureDate = @"2016-10-20T10:00:00Z";
    flight.arrivalDate = @"2016-10-20T11:00:00Z";
    flight.price = 12300;
    flight.departureAirport = @"";
    flight.arrivalAirport = @"";
    
    OBFlightViewModel *flightModel = [[OBFlightViewModel alloc] initWithFlight:flight];
    
    XCTAssertEqualObjects(flightModel.airlineText, @"FastJet");
    XCTAssertEqualObjects(flightModel.priceText, @"$12,300.00");
    XCTAssertEqualObjects(flightModel.arrivalText, @"2016-20-10 11:00:00");
    XCTAssertEqualObjects(flightModel.departureText, @"2016-20-10 10:00:00");
}
@end
