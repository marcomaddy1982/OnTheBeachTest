//
//  OBHotel.m
//  OnTheBeachTest
//
//  Created by MacBook Pro Retina on 03/02/17.
//  Copyright © 2017 OnTheBeach. All rights reserved.
//

#import "OBHotel.h"

@implementation OBHotel

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        _imageURLs  = [NSArray array];
        _facilities = [NSArray array];
        _rating     = 0;
    }
    
    return  self;
}

- (void)dealloc {
    
    _name       = nil;
    _location   = nil;
    _descr      = nil;
    _imageURLs  = nil;
    _facilities = nil;
}

@end
