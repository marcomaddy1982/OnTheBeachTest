//
//  PerserTests.m
//  OnTheBeachTest
//
//  Created by MacBook Pro Retina on 06/02/17.
//  Copyright © 2017 OnTheBeach. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "OBDataParser.h"
#import "OBFlightViewModel.h"
#import "OBHotelViewModel.h"

@interface OBPerserTests : XCTestCase

@end

@implementation OBPerserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

#pragma mark - flights

- (void)testParserFlightsResponseKONill {
    NSString *response = @"{[{\"airline\": \"FastJet\",\"departure_date\":\"2016-10-20T10:00:00Z\",\"arrival_date\": \"2016-10-20T11:00:00Z\",\"price\": 12300,\"departure_airport\": \"London Gatwick\",\"arrival_airport\": \"Barcelona\"},{\"airline\": \"FastJet\",\"departure_date\": \"2016-10-20T10:50:00Z\",\"arrival_date\": \"2016-10-20T11:50:00Z\",\"price\": 13300,\"departure_airport\": \"London Gatwick\",\"arrival_airport\": \"Girona\"}";
    
    NSData *responseData = [response dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&error];
    
    NSArray *flights = [OBDataParser parserGetFlights:jsonDict];
    
    XCTAssertNil(flights);
}

- (void)testParserFlightsResponseOkNotNill {
    NSString *response = @"{\"flights\": [{\"airline\": \"FastJet\",\"departure_date\":\"2016-10-20T10:00:00Z\",\"arrival_date\": \"2016-10-20T11:00:00Z\",\"price\": 12300,\"departure_airport\": \"London Gatwick\",\"arrival_airport\": \"Barcelona\"},{\"airline\": \"FastJet\",\"departure_date\": \"2016-10-20T10:50:00Z\",\"arrival_date\": \"2016-10-20T11:50:00Z\",\"price\": 13300,\"departure_airport\": \"London Gatwick\",\"arrival_airport\": \"Girona\"},{\"airline\": \"QuickJet\",\"departure_date\": \"2016-10-20T22:00:00Z\",\"arrival_date\": \"2016-10-21T00:00:00Z\",\"price\": 12500,\"departure_airport\": \"London Gatwick\",\"arrival_airport\": \"Antalya\"},{\"airline\": \"FastJet\",\"departure_date\": \"2016-10-20T10:00:00Z\",\"arrival_date\": \"2016-10-20T11:00:00Z\",\"price\": 12350,\"departure_airport\": \"London Gatwick\",\"arrival_airport\": \"Barcelona\"}]}";
    
    NSData *responseData = [response dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&error];
    
    NSArray *flights = [OBDataParser parserGetFlights:jsonDict];
    
    XCTAssertNotNil(flights);
    
}

- (void)testParserFlightsResponseOkCount {
    NSString *response = @"{\"flights\": [{\"airline\": \"FastJet\",\"departure_date\":\"2016-10-20T10:00:00Z\",\"arrival_date\": \"2016-10-20T11:00:00Z\",\"price\": 12300,\"departure_airport\": \"London Gatwick\",\"arrival_airport\": \"Barcelona\"},{\"airline\": \"FastJet\",\"departure_date\": \"2016-10-20T10:50:00Z\",\"arrival_date\": \"2016-10-20T11:50:00Z\",\"price\": 13300,\"departure_airport\": \"London Gatwick\",\"arrival_airport\": \"Girona\"},{\"airline\": \"QuickJet\",\"departure_date\": \"2016-10-20T22:00:00Z\",\"arrival_date\": \"2016-10-21T00:00:00Z\",\"price\": 12500,\"departure_airport\": \"London Gatwick\",\"arrival_airport\": \"Antalya\"},{\"airline\": \"FastJet\",\"departure_date\": \"2016-10-20T10:00:00Z\",\"arrival_date\": \"2016-10-20T11:00:00Z\",\"price\": 12350,\"departure_airport\": \"London Gatwick\",\"arrival_airport\": \"Barcelona\"}]}";
    
    NSData *responseData = [response dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&error];
    
    NSArray *flights = [OBDataParser parserGetFlights:jsonDict];

    XCTAssertTrue(flights.count == 4);
}

- (void)testParserFlightViewModelAllFieldsFull {
    
    NSString *response = @"{\"flights\": [{\"airline\": \"FastJet\",\"departure_date\":\"2016-10-20T10:00:00Z\",\"arrival_date\": \"2016-10-20T11:00:00Z\",\"price\": 12300,\"departure_airport\": \"London Gatwick\",\"arrival_airport\": \"Barcelona\"},{\"airline\": \"FastJet\",\"departure_date\": \"2016-10-20T10:50:00Z\",\"arrival_date\": \"2016-10-20T11:50:00Z\",\"price\": 13300,\"departure_airport\": \"London Gatwick\",\"arrival_airport\": \"Girona\"},{\"airline\": \"QuickJet\",\"departure_date\": \"2016-10-20T22:00:00Z\",\"arrival_date\": \"2016-10-21T00:00:00Z\",\"price\": 12500,\"departure_airport\": \"London Gatwick\",\"arrival_airport\": \"Antalya\"},{\"airline\": \"FastJet\",\"departure_date\": \"2016-10-20T10:00:00Z\",\"arrival_date\": \"2016-10-20T11:00:00Z\",\"price\": 12350,\"departure_airport\": \"London Gatwick\",\"arrival_airport\": \"Barcelona\"}]}";
    
    NSData *responseData = [response dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&error];
    
    NSArray *flights = [OBDataParser parserGetFlights:jsonDict];
    
    OBFlightViewModel *flightModel = flights[0];
    
    XCTAssertEqualObjects(flightModel.airlineText, @"FastJet");
    XCTAssertEqualObjects(flightModel.priceText, @"$12,300.00");
    XCTAssertEqualObjects(flightModel.arrivalText, @"2016-20-10 11:00:00 - Barcelona");
    XCTAssertEqualObjects(flightModel.departureText, @"2016-20-10 10:00:00 - London Gatwick");
}

- (void)testParserFlightViewModelAllFieldsEmpty {
    
    NSString *response = @"{\"flights\": [{\"airline\": \"\",\"departure_date\":\"\",\"arrival_date\": \"\",\"departure_airport\": \"\",\"arrival_airport\": \"\"}]}";
    
    NSData *responseData = [response dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&error];
    
    NSArray *flights = [OBDataParser parserGetFlights:jsonDict];
    
    OBFlightViewModel *flightModel = flights[0];
    
    XCTAssertEqualObjects(flightModel.airlineText, @"");
    XCTAssertEqualObjects(flightModel.priceText, @"$0.00");
    XCTAssertEqualObjects(flightModel.arrivalText, @"");
    XCTAssertEqualObjects(flightModel.departureText, @"");
}

- (void)testParserFlightViewModelDateFieldsEmpty {
    
    NSString *response = @"{\"flights\": [{\"airline\": \"FastJet\",\"price\": 12300,\"departure_date\":\"\",\"arrival_date\": \"\",\"departure_airport\": \"London Gatwick\",\"arrival_airport\": \"Barcelona\"}]}";
    
    NSData *responseData = [response dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&error];
    
    NSArray *flights = [OBDataParser parserGetFlights:jsonDict];
    
    OBFlightViewModel *flightModel = flights[0];
    
    XCTAssertEqualObjects(flightModel.airlineText, @"FastJet");
    XCTAssertEqualObjects(flightModel.priceText, @"$12,300.00");
    XCTAssertEqualObjects(flightModel.arrivalText, @"Barcelona");
    XCTAssertEqualObjects(flightModel.departureText, @"London Gatwick");
}

- (void)testParserFlightViewModelAirportFieldsEmpty {
    
    NSString *response = @"{\"flights\": [{\"airline\": \"FastJet\",\"price\": 12300,\"departure_date\":\"2016-10-20T10:00:00Z\",\"arrival_date\": \"2016-10-20T11:00:00Z\",\"departure_airport\": \"\",\"arrival_airport\": \"\"}]}";
    
    NSData *responseData = [response dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&error];
    
    NSArray *flights = [OBDataParser parserGetFlights:jsonDict];
    
    OBFlightViewModel *flightModel = flights[0];
    
    XCTAssertEqualObjects(flightModel.airlineText, @"FastJet");
    XCTAssertEqualObjects(flightModel.priceText, @"$12,300.00");
    XCTAssertEqualObjects(flightModel.arrivalText, @"2016-20-10 11:00:00");
    XCTAssertEqualObjects(flightModel.departureText, @"2016-20-10 10:00:00");
}

#pragma mark - hotel

- (void)testParserHotelResponseKONill {
    
    NSString *response = @"{\"name\": \"Labranda Isla Bonita Hotel\",\"hotel_location\": \"Costa Adeje, Tenerife, Canaries\",\"description\": \"On the Beach Offer - Save up to 15%\r\nBook this hotel by 31.10.2016, for travel between 01.11.2016 and 30.04.2017. Offer applicable to all room types on any board basis.\",\"images\": [\"https://i.onthebeach.co.uk/v1/hotel_images/1ba1aa1c-17e4-4717-afe7-f2b2ea877b87/cover/374/296/high/1.0/labranda-isla-bonita-hotel.jpeg\",\"https://i.onthebeach.co.uk/v1/hotel_images/73f82009-b0f5-43b6-9eee-cb0fb25f459a/cover/374/296/high/1.0/labranda-isla-bonita-hotel.jpeg\",\"https://i.onthebeach.co.uk/v1/hotel_images/d26659fb-e513-4fbf-9fed-2c24583ad4f0/cover/374/296/high/1.0/labranda-isla-bonita-hotel.jpeg\"],\"rating\": 4,\"facilities\": [\"24 Hour Reception\",\"Aerobics\",\"Air Conditioning\"]";
    
    NSData *responseData = [response dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&error];
    
    OBHotelViewModel *hotelModelView = [OBDataParser parserGetHotel:jsonDict];
    
    XCTAssertNil(hotelModelView);
}

- (void)testParserHotelResponseOkNotNill {
    
    NSString *response = @"{\"name\": \"Labranda Isla Bonita Hotel\",\"hotel_location\": \"Costa Adeje, Tenerife, Canaries\",\"description\": \"On the Beach Offer - Save up to 15% Book this hotel by 31.10.2016, for travel between 01.11.2016 and 30.04.2017. Offer applicable to all room types on any board basis.\",\"images\": [\"https://i.onthebeach.co.uk/v1/hotel_images/1ba1aa1c-17e4-4717-afe7-f2b2ea877b87/cover/374/296/high/1.0/labranda-isla-bonita-hotel.jpeg\",\"https://i.onthebeach.co.uk/v1/hotel_images/73f82009-b0f5-43b6-9eee-cb0fb25f459a/cover/374/296/high/1.0/labranda-isla-bonita-hotel.jpeg\",\"https://i.onthebeach.co.uk/v1/hotel_images/d26659fb-e513-4fbf-9fed-2c24583ad4f0/cover/374/296/high/1.0/labranda-isla-bonita-hotel.jpeg\"],\"rating\": 4,\"facilities\": [\"24 Hour Reception\",\"Aerobics\",\"Air Conditioning\"]}";
    
    NSData *responseData = [response dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&error];
    
    OBHotelViewModel *hotelModelView = [OBDataParser parserGetHotel:jsonDict];
    
    XCTAssertNotNil(hotelModelView);
}

- (void)testParserHotelResponseOkObjectField {
    
    NSString *response = @"{\"name\": \"Labranda Isla Bonita Hotel\",\"hotel_location\": \"Costa Adeje, Tenerife, Canaries\",\"description\": \"On the Beach Offer - Save up to 15% Book this hotel by 31.10.2016, for travel between 01.11.2016 and 30.04.2017. Offer applicable to all room types on any board basis.\",\"images\": [\"https://i.onthebeach.co.uk/v1/hotel_images/1ba1aa1c-17e4-4717-afe7-f2b2ea877b87/cover/374/296/high/1.0/labranda-isla-bonita-hotel.jpeg\",\"https://i.onthebeach.co.uk/v1/hotel_images/73f82009-b0f5-43b6-9eee-cb0fb25f459a/cover/374/296/high/1.0/labranda-isla-bonita-hotel.jpeg\",\"https://i.onthebeach.co.uk/v1/hotel_images/d26659fb-e513-4fbf-9fed-2c24583ad4f0/cover/374/296/high/1.0/labranda-isla-bonita-hotel.jpeg\"],\"rating\": 4,\"facilities\": [\"24 Hour Reception\",\"Aerobics\",\"Air Conditioning\"]}";
    
    NSData *responseData = [response dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&error];
    
    OBHotelViewModel *hotelModelView = [OBDataParser parserGetHotel:jsonDict];
    
    XCTAssertEqualObjects(hotelModelView.nameText, @"Labranda Isla Bonita Hotel");
    XCTAssertEqualObjects(hotelModelView.locationText, @"Location: Costa Adeje, Tenerife, Canaries");
    XCTAssertEqualObjects(hotelModelView.descrText, @"Description: On the Beach Offer - Save up to 15% Book this hotel by 31.10.2016, for travel between 01.11.2016 and 30.04.2017. Offer applicable to all room types on any board basis.");
    XCTAssertTrue(hotelModelView.imageURLs.count == 3);
    XCTAssertEqualObjects(hotelModelView.imageURLs[0], @"https://i.onthebeach.co.uk/v1/hotel_images/1ba1aa1c-17e4-4717-afe7-f2b2ea877b87/cover/374/296/high/1.0/labranda-isla-bonita-hotel.jpeg");
    XCTAssertEqualObjects(hotelModelView.imageURLs[1], @"https://i.onthebeach.co.uk/v1/hotel_images/73f82009-b0f5-43b6-9eee-cb0fb25f459a/cover/374/296/high/1.0/labranda-isla-bonita-hotel.jpeg");
    XCTAssertEqualObjects(hotelModelView.imageURLs[2], @"https://i.onthebeach.co.uk/v1/hotel_images/d26659fb-e513-4fbf-9fed-2c24583ad4f0/cover/374/296/high/1.0/labranda-isla-bonita-hotel.jpeg");
    XCTAssertEqualObjects(hotelModelView.ratingText, @"Rating: 4");
    XCTAssertEqualObjects(hotelModelView.facilitiesText, @"Facilities: 24 Hour Reception, Aerobics, Air Conditioning.");

}

- (void)testParserHotelViewModelAllFieldsEmpty {

    NSString *response = @"{\"name\": \"\",\"hotel_location\": \"\",\"description\": \"\"}";
    
    NSData *responseData = [response dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&error];
    
    OBHotelViewModel *hotelModelView = [OBDataParser parserGetHotel:jsonDict];
    
    XCTAssertEqualObjects(hotelModelView.nameText, @"");
    XCTAssertEqualObjects(hotelModelView.locationText, @"No Location.");
    XCTAssertEqualObjects(hotelModelView.descrText, @"No Description.");
    XCTAssertTrue(hotelModelView.imageURLs.count == 0);
    XCTAssertEqualObjects(hotelModelView.ratingText, @"No Rating.");
    XCTAssertEqualObjects(hotelModelView.facilitiesText, @"No Facilities.");
}


@end
