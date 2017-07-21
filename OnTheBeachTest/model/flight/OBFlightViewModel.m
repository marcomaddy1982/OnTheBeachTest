//
//  OBFlightViewModel.m
//  OnTheBeachTest
//
//  Created by MacBook Pro Retina on 04/02/17.
//  Copyright © 2017 OnTheBeach. All rights reserved.
//

#import "OBFlightViewModel.h"
#import "OBFlight.h"

@interface OBFlightViewModel(){

    OBFlight *_flight;
    NSNumberFormatter *_numberFormatter;
    NSDateFormatter   *_dateFormatter;
}

@end

@implementation OBFlightViewModel

#pragma mark - init

- (instancetype)initWithFlight:(OBFlight *)flight {
    
    self = [self init];
    
    if (self) {
        _flight = flight;
    }
    
    return self;
}

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        _numberFormatter = [[NSNumberFormatter alloc] init];
        [_numberFormatter setMinimumFractionDigits:2];
        [_numberFormatter setMaximumFractionDigits:2];
        
        _dateFormatter   = [[NSDateFormatter alloc] init];
    }
    
    return self;
}

- (void)dealloc {

    _flight          = nil;
    _numberFormatter = nil;
    _dateFormatter   = nil;
}

#pragma mark - getter

- (NSString *)airlineText {

    return _flight.airline ? _flight.airline : @"";
}

- (NSString *)priceText {

    [_numberFormatter setNumberStyle: NSNumberFormatterCurrencyStyle];
    
    return [_numberFormatter stringFromNumber:[NSNumber numberWithFloat:_flight.price]] > 0 ? [_numberFormatter stringFromNumber:[NSNumber numberWithFloat:_flight.price]] : @"";
}

- (NSString *)departureText {
    
    [_dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
    NSDate *departureDate = [_dateFormatter dateFromString:_flight.departureDate];
    
    [_dateFormatter setDateFormat:@"yyyy-dd-MM HH:mm:ss"];
    NSString *departureDateStr = [_dateFormatter stringFromDate:departureDate];
    
    BOOL hasDepartureDate = departureDateStr && [departureDateStr length];
    BOOL hasDepartureAirport = _flight.departureAirport && [_flight.departureAirport length];
    
    return [NSString stringWithFormat:@"%@%@%@",hasDepartureDate ? departureDateStr : @"",
            (hasDepartureDate && hasDepartureAirport) ? @" - " : @"",
            hasDepartureAirport ? _flight.departureAirport : @""];
    
}

- (NSString *)arrivalText {
    
    [_dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
    NSDate *arrivalDate = [_dateFormatter dateFromString:_flight.arrivalDate];
    
    [_dateFormatter setDateFormat:@"yyyy-dd-MM HH:mm:ss"];
    NSString *arrivalDateStr = [_dateFormatter stringFromDate:arrivalDate];
    
    BOOL hasArrivalDate = arrivalDateStr && [arrivalDateStr length];
    BOOL hasArrivalAirport = _flight.arrivalDate && [_flight.arrivalAirport length];
    
    return [NSString stringWithFormat:@"%@%@%@",hasArrivalDate ? arrivalDateStr : @"",
            (hasArrivalDate && hasArrivalAirport) ? @" - " : @"",
            hasArrivalAirport ? _flight.arrivalAirport : @""];
}

@end
