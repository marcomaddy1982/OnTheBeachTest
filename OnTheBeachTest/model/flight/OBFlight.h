//
//  OBFlight.h
//  OnTheBeachTest
//
//  Created by MacBook Pro Retina on 03/02/17.
//  Copyright © 2017 OnTheBeach. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OBFlight : NSObject
@property (nonatomic, strong) NSString  *airline;
@property (nonatomic, strong) NSString  *departureDate;
@property (nonatomic, strong) NSString  *arrivalDate;
@property (nonatomic, unsafe_unretained) CGFloat price;
@property (nonatomic, strong) NSString *departureAirport;
@property (nonatomic, strong) NSString *arrivalAirport;

@end
