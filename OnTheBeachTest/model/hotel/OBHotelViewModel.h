//
//  OBHotelViewModel.h
//  OnTheBeachTest
//
//  Created by MacBook Pro Retina on 06/02/17.
//  Copyright © 2017 OnTheBeach. All rights reserved.
//

#import <Foundation/Foundation.h>
@class OBHotel;

@interface OBHotelViewModel : NSObject

- (instancetype)initWithHotel:(OBHotel *)hotel;

@property (nonatomic,strong,readonly) NSString *nameText;
@property (nonatomic,strong,readonly) NSString *locationText;
@property (nonatomic,strong,readonly) NSString *descrText;
@property (nonatomic,strong,readonly) NSArray  *imageURLs;
@property (nonatomic,strong,readonly) NSString *ratingText;
@property (nonatomic,strong,readonly) NSString *facilitiesText;


@end
