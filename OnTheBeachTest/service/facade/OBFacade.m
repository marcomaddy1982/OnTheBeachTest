//  PTFacade.m
//  OnTheBeachTest
//
//  Created by MacBook Pro Retina on 03/02/17.
//  Copyright © 2017 OnTheBeach. All rights reserved.
//

#import "OBFacade.h"
#import "OBDataParser.h"
#import "OBHotelViewModel.h"

@implementation OBFacade

+ (void)getHotelWithSuccess:(LoadObjectSuccessBlock)success failure:(LoadErrorFailureBlock)failure {
    
    [OBNetworkService GetHotelWithSuccess:^(NSURLSessionTask *task, id responseObject) {
        
        dispatch_async( dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            @autoreleasepool
            {
                OBHotelViewModel *hotel = [OBDataParser parserGetHotel:(NSDictionary *)responseObject];
                
                if (hotel) {
                    success(hotel);
                }
            }
        });
        
    } failure:^(NSURLSessionTask *task, NSError *error) {
        
        if (failure) {
            failure(error);
        }
    }];
    
}
+ (void)getFlightsWithSuccess:(LoadObjectSuccessBlock)success failure:(LoadErrorFailureBlock)failure {

    [OBNetworkService getFlightsWithSuccess:^(NSURLSessionTask *task, id responseObject) {
        
        dispatch_async( dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            @autoreleasepool
            {
                NSArray *flights = [OBDataParser parserGetFlights:(NSDictionary *)responseObject];
                
                if (flights) {
                    success(flights);
                }
            }
        });
        
    } failure:^(NSURLSessionTask *task, NSError *error) {
        
        if (failure) {
            failure(error);
        }
    }];

}

@end
