//
//  OBConstant.m
//  OnTheBeachTest
//
//  Created by MacBook Pro Retina on 03/02/17.
//  Copyright © 2017 OnTheBeach. All rights reserved.
//

#import "OBConstant.h"

/*
 * Request
 */
NSString* const kOBHotelsRequestUrl             = @"http://pastebin.com/raw/f0Tm6bfy";
NSString* const kOBFlightsRequestUrl            = @"http://pastebin.com/raw/bFnZQEx0";

/*
 * Parser
 */
NSString* const kOBParserHotelName              = @"name";
NSString* const kOBParserHotelLocation          = @"hotel_location";
NSString* const kOBParserHotelDescription       = @"description";
NSString* const kOBParserHotelImageURLs         = @"images";
NSString* const kOBParserHotelRating            = @"rating";
NSString* const kOBParserHotelFacilities        = @"facilities";


NSString* const kOBParserFlightFlights          = @"flights";
NSString* const kOBParserFlightAirline          = @"airline";
NSString* const kOBParserFlightDepartureDate    = @"departure_date";
NSString* const kOBParserFlightArrivalDate      = @"arrival_date";
NSString* const kOBParserFlightPrice            = @"price";
NSString* const kOBParserFlightDepartureAirport = @"departure_airport";
NSString* const kOBParserFlightArrivalAirport   = @"arrival_airport";

/*
 * FlightViewController
 */
CGFloat const kOBFlightViewControllerRowHeight   = 150.0f;
