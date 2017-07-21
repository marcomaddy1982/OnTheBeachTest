//
//  YONetworkService.h
//  OnTheBeachTest
//
//  Created by MacBook Pro Retina on 03/02/17.
//  Copyright © 2017 OnTheBeach. All rights reserved.
//


#import "AFNetworking.h"

@interface OBNetworkService : NSObject

typedef void (^NetworkServiceSuccessBlock)(NSURLSessionTask *task, id responseObject);
typedef void (^NetworkServiceFailureBlock)(NSURLSessionTask *task, NSError *error);

+ (void)GetHotelWithSuccess:(NetworkServiceSuccessBlock)success failure:(NetworkServiceFailureBlock)failure;
+ (void)getFlightsWithSuccess:(NetworkServiceSuccessBlock)success failure:(NetworkServiceFailureBlock)failure;

@end
