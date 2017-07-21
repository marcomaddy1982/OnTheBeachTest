//
//  OBHotelViewModel.m
//  OnTheBeachTest
//
//  Created by MacBook Pro Retina on 06/02/17.
//  Copyright © 2017 OnTheBeach. All rights reserved.
//

#import "OBHotelViewModel.h"
#import "OBHotel.h"

@interface OBHotelViewModel(){
    
    OBHotel *_hotel;
}

@end

@implementation OBHotelViewModel

- (instancetype)initWithHotel:(OBHotel *)hotel {

    self = [self init];
    
    if (self) {
        _hotel = hotel;
    }
    
    return self;

}

- (void)dealloc
{
    _hotel = nil;
}

#pragma mark - getter 

- (NSString *)nameText {
    
    return _hotel.name && ![_hotel.name isEqualToString:@""] ? _hotel.name : @"";
}

- (NSString *)locationText {

    return _hotel.location && ![_hotel.location isEqualToString:@""] ? [NSString stringWithFormat:@"Location: %@",_hotel.location] : @"No Location.";
}

- (NSString *)descrText {
    
    return _hotel.descr && ![_hotel.descr isEqualToString:@""] ? [NSString stringWithFormat:@"Description: %@",_hotel.descr] : @"No Description.";
}

- (NSString *)ratingText {
    
    return _hotel.rating ? [NSString stringWithFormat:@"Rating: %ld", (long)_hotel.rating] : @"No Rating.";
}

- (NSArray *)imageURLs {

    return _hotel.imageURLs;
}

- (NSString *)facilitiesText {

    if (_hotel.facilities.count == 0) {
        return @"No Facilities.";
    }
    
    NSString *result = @"Facilities: ";
    
    for (NSString *facility in _hotel.facilities) {
    
        result = [result stringByAppendingString:[facility isEqual:[_hotel.facilities lastObject]] ? [NSString stringWithFormat:@"%@.",facility] : [NSString stringWithFormat:@"%@, ",facility]];
        
    }
    
    return result;
}

@end
