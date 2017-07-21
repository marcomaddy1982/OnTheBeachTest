//
//  OBHotel.h
//  OnTheBeachTest
//
//  Created by MacBook Pro Retina on 03/02/17.
//  Copyright © 2017 OnTheBeach. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OBHotel : NSObject
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *location;
@property (nonatomic,strong) NSString *descr;
@property (nonatomic,strong) NSArray  *imageURLs;
@property (nonatomic,unsafe_unretained) NSInteger rating;
@property (nonatomic,strong) NSArray  *facilities;

@end
