//
//  AdjustProvider.m
//
//  Created by Engin Kurutepe on 10/11/2014.
//  Copyright (c) 2014 Engin Kurutepe. All rights reserved.
//

#import "AdjustProvider.h"
#import "ARAnalyticsProviders.h"
#import "Adjust.h"

@implementation AdjustProvider

- (id)initWithIdentifier:(NSString *)identifier {
    NSAssert([Adjust class], @"Adjust is not included");
    [Adjust appDidLaunch:identifier];
    
#if defined (DEBUG)
    [Adjust setEnvironment:AIEnvironmentSandbox];
#else
    [Adjust setEnvironment:AIEnvironmentProduction];
#endif
    
    return [super init];
}

- (void)event:(NSString *)event withProperties:(NSDictionary *)properties {
    if(_eventTokenMap && [_eventTokenMap containsKey:event])
        [Adjust trackEvent:_eventTokenMap[event] withParameters:properties];
}

- (void) setEventTokenMap:(NSDictionary *)eventTokenMap {
    if(_eventTokenMap != eventTokenMap)
        _eventTokenMap = eventTokenMap;
}



@end
