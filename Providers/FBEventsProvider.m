//
//  FBEventsProvider.m
//
//  Created by Said marouf on 10/3/2015.
//  Copyright (c) 2015 Said Marouf. All rights reserved.
//

#import "FBEventsProvider.h"
#import <Facebook-iOS-SDK/FacebookSDK/FacebookSDK.h>

@interface FBEventsProvider ()
@end


@implementation FBEventsProvider

- (void)event:(NSString *)event withProperties:(NSDictionary *)properties {
    [FBAppEvents logEvent:event parameters:properties];
}

@end
