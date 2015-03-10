//
//  FBEventProvider.m
//
//  Created by Said marouf on 10/3/2015.
//  Copyright (c) 2015 Said Marouf. All rights reserved.
//

#import "FBEventProvider.h"
#import "ARAnalyticsProviders.h"

@interface FBEventProvider ()
@end


@implementation FBEventProvider

- (void)event:(NSString *)event withProperties:(NSDictionary *)properties {
    [FBAppEvents logEvent:event parameters:properties];
}

@end
