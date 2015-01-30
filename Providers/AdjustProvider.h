//
//  AdjustProvider.h
//
//  Created by Engin Kurutepe on 10/11/2014.
//  Copyright (c) 2014 Engin Kurutepe. All rights reserved.
//

#import "ARAnalyticalProvider.h"

@protocol AdjustDelegate;

@interface AdjustProvider : ARAnalyticalProvider
- (id)initWithIdentifier:(NSString *)identifier eventTokenMap:(NSDictionary *)eventTokenMap;
+ (void) setAdjustDelegate:(id<AdjustDelegate>) delegate;
+ (void) appDidLaunch;
@end
