//
//  YONetworkService.m
//  OnTheBeachTest
//
//  Created by MacBook Pro Retina on 03/02/17.
//  Copyright © 2017 OnTheBeach. All rights reserved.
//

#import "OBNetworkService.h"

@interface OBNetworkService ()

@end

@implementation OBNetworkService

#pragma mark - public implememtation

+ (void)GetHotelWithSuccess:(NetworkServiceSuccessBlock)success failure:(NetworkServiceFailureBlock)failure {

    NSURL *URL = [NSURL URLWithString:kOBHotelsRequestUrl];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",nil];
    [manager GET:URL.absoluteString parameters:nil progress:nil success:success failure:failure];
}

+ (void)getFlightsWithSuccess:(NetworkServiceSuccessBlock)success failure:(NetworkServiceFailureBlock)failure {

    NSURL *URL = [NSURL URLWithString:kOBFlightsRequestUrl];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",nil];
    [manager GET:URL.absoluteString parameters:nil progress:nil success:success failure:failure];
}
 
@end
