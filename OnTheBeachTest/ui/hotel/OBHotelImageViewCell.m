//
//  OBHotelImageViewCell.m
//  OnTheBeachTest
//
//  Created by MacBook Pro Retina on 06/02/17.
//  Copyright © 2017 OnTheBeach. All rights reserved.
//

#import "OBHotelImageViewCell.h"

@implementation OBHotelImageViewCell

- (void)prepareForReuse {
    [super prepareForReuse];
    [_indicatorLoading startAnimating];
    _imgViewHotel.image   = nil;
}

@end
