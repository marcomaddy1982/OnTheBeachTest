//
//  PTFacade.h
//  OnTheBeachTest
//
//  Created by MacBook Pro Retina on 03/02/17.
//  Copyright © 2017 OnTheBeach. All rights reserved.
//

#import "OBNetworkService.h"

@interface OBFacade : NSObject

typedef void (^LoadSuccessBlock)(void);
typedef void (^LoadObjectSuccessBlock)(id object);
typedef void (^LoadErrorFailureBlock)(NSError *error);

+ (void)getHotelWithSuccess:(LoadObjectSuccessBlock)success failure:(LoadErrorFailureBlock)failure;
+ (void)getFlightsWithSuccess:(LoadObjectSuccessBlock)success failure:(LoadErrorFailureBlock)failure;

@end
