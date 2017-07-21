//
//  Copyright (c) 2014 Open Reply. All rights reserved.
//

#import "NSObject+NSKeyValueCodingExtended.h"


@implementation NSObject (NSKeyValueCodingExtended)

- (id)valueForKeyPathOrNil:(NSString *)keyPath {
    id value = nil;
    if (keyPath) {
        value = [self valueForKeyPath:keyPath];
        if ([value isMemberOfClass:NSNull.class]) {
            value = nil;
        }
    }
    
    return value;
}

@end
