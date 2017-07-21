//
//  OBFlightViewModel.h
//  OnTheBeachTest
//
//  Created by MacBook Pro Retina on 04/02/17.
//  Copyright © 2017 OnTheBeach. All rights reserved.
//

#import <Foundation/Foundation.h>
@class OBFlight;

@interface OBFlightViewModel : NSObject

@property (nonatomic, strong, readonly) NSString *airlineText;
@property (nonatomic, strong, readonly) NSString *departureText;
@property (nonatomic, strong, readonly) NSString *arrivalText;
@property (nonatomic, strong, readonly) NSString *priceText;

- (instancetype)initWithFlight:(OBFlight *)flight;
@end
