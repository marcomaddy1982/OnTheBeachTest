//
//  OBConnectivityManager.h
//  OnTheBeachTest
//
//  Created by MacBook Pro Retina on 03/02/17.
//  Copyright © 2017 OnTheBeach. All rights reserved.
//

@class Reachability;

@interface OBConnectivityManager : NSObject{

    Reachability *_reachability;
}

@property (nonatomic, readonly, getter = isNetworkAvailable) BOOL networkAvailable;

+ (id)sharedManager;
+ (void)executeBlockIfConnectionIsAvailable:(void (^)())blockAction errorBlock:(void (^)())errorBlock;

@end
