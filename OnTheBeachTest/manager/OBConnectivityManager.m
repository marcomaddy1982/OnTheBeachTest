//
//  OBConnectivityManager.m
//  OnTheBeachTest
//
//  Created by MacBook Pro Retina on 03/02/17.
//  Copyright © 2017 OnTheBeach. All rights reserved.
//

#import "OBConnectivityManager.h"
#import "Reachability.h"

@interface OBConnectivityManager () <UIAlertViewDelegate>

@end

@implementation OBConnectivityManager
@synthesize networkAvailable;

static OBConnectivityManager *_sharedManager = nil;

#pragma mark - Initialization Methods

+ (id)sharedManager {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[OBConnectivityManager alloc] init];
    });
    
    return _sharedManager;
}

- (id)init
{
    self = [super init];
    if (self) {
        _reachability = [Reachability reachabilityForInternetConnection];
        [_reachability startNotifier];
    }
    return self;
}

#pragma mark - Getter
- (BOOL)isNetworkAvailable {
    return [_reachability isReachable];
}

#pragma mark - Public Implementation

+ (void)executeBlockIfConnectionIsAvailable:(void (^)())blockAction errorBlock:(void (^)())errorBlock {
    
    if ([[OBConnectivityManager sharedManager] isNetworkAvailable]) {
        if (blockAction) {
            blockAction();
        }
    } else {
        if (errorBlock) {
            errorBlock();
        }
    }
}

@end
