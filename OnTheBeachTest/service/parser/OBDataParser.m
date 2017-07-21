//
//  YODataParser.m
//  OnTheBeachTest
//
//  Created by MacBook Pro Retina on 03/02/17.
//  Copyright © 2017 OnTheBeach. All rights reserved.
//

#import "OBDataParser.h"
#import "NSObject+NSKeyValueCodingExtended.h"
#import "OBHotel.h"
#import "OBHotelViewModel.h"
#import "OBFlight.h"
#import "OBFlightViewModel.h"

@implementation OBDataParser

#pragma mark - public implementation

+ (OBHotelViewModel *)parserGetHotel:(NSDictionary *) objectToParse{
    
    if (!objectToParse) {
        
        return nil;
    }
    
    OBHotel *hotel = [[OBHotel alloc] init];
    
    if ([objectToParse valueForKeyPathOrNil:kOBParserHotelName]){
        hotel.name = objectToParse[kOBParserHotelName];
    }
    
    if ([objectToParse valueForKeyPathOrNil:kOBParserHotelLocation]){
        hotel.location = objectToParse[kOBParserHotelLocation];
    }
    
    if ([objectToParse valueForKeyPathOrNil:kOBParserHotelDescription]){
        hotel.descr = objectToParse[kOBParserHotelDescription];
    }
    
    if ([objectToParse valueForKeyPathOrNil:kOBParserHotelImageURLs]){
        hotel.imageURLs = objectToParse[kOBParserHotelImageURLs];
    }
    
    if ([objectToParse valueForKeyPathOrNil:kOBParserHotelRating]){
        hotel.rating = [objectToParse[kOBParserHotelRating] integerValue];
    }
    
    if ([objectToParse valueForKeyPathOrNil:kOBParserHotelFacilities]){
        hotel.facilities = objectToParse[kOBParserHotelFacilities];
    }

    return [[OBHotelViewModel alloc] initWithHotel:hotel];
}

+ (NSMutableArray *)parserGetFlights:(NSDictionary *) objectToParse {
    
    if (!objectToParse) {
        return nil;
    }
    
    NSMutableArray *flights = [NSMutableArray array];
    
    if ([objectToParse valueForKeyPathOrNil:kOBParserFlightFlights]){
        
        for (NSDictionary *flightDict in objectToParse[kOBParserFlightFlights]) {
            
            OBFlight *flight = [[OBFlight alloc] init];
            
            if ([flightDict valueForKeyPathOrNil:kOBParserFlightAirline]){
                flight.airline = flightDict[kOBParserFlightAirline];
            }
            
            if ([flightDict valueForKeyPathOrNil:kOBParserFlightDepartureDate]){
                flight.departureDate = flightDict[kOBParserFlightDepartureDate];
            }
            
            if ([flightDict valueForKeyPathOrNil:kOBParserFlightArrivalDate]){
                flight.arrivalDate = flightDict[kOBParserFlightArrivalDate];
            }
            
            if ([flightDict valueForKeyPathOrNil:kOBParserFlightPrice]){
                flight.price = [flightDict[kOBParserFlightPrice] floatValue];
            }
            
            if ([flightDict valueForKeyPathOrNil:kOBParserFlightDepartureAirport]){
                flight.departureAirport = flightDict[kOBParserFlightDepartureAirport];
            }
            
            if ([flightDict valueForKeyPathOrNil:kOBParserFlightArrivalAirport]){
                flight.arrivalAirport = flightDict[kOBParserFlightArrivalAirport];
            }
            
            OBFlightViewModel *viewModel = [[OBFlightViewModel alloc] initWithFlight:flight];
            [flights addObject:viewModel];
        }
    
    }
    
    return flights;
    
}

@end
