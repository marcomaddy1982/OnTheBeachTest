//
//  YODataParser.h
//  OnTheBeachTest
//
//  Created by MacBook Pro Retina on 03/02/17.
//  Copyright © 2017 OnTheBeach. All rights reserved.
//

@class OBHotelViewModel;
@interface OBDataParser : NSObject

+ (OBHotelViewModel *)parserGetHotel:(NSDictionary *) objectToParse;
+ (NSMutableArray *)parserGetFlights:(NSDictionary *) objectToParse;

@end
