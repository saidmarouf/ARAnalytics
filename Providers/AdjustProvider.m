//
//  AdjustProvider.m
//
//  Created by Engin Kurutepe on 10/11/2014.
//  Copyright (c) 2014 Engin Kurutepe. All rights reserved.
//

#import "AdjustProvider.h"
#import "ARAnalyticsProviders.h"
#import "Adjust.h"

@interface AdjustProvider()
@property (nonatomic, strong) NSDictionary *eventTokenMap;
@end


@implementation AdjustProvider

- (id)initWithIdentifier:(NSString *)identifier eventTokenMap:(NSDictionary *)eventTokenMap {
    NSAssert([Adjust class], @"Adjust is not included");
    [Adjust appDidLaunch:identifier];
    
#if defined (DEBUG)
    [Adjust setEnvironment:AIEnvironmentSandbox];
#else
    [Adjust setEnvironment:AIEnvironmentProduction];
#endif
    
    if(self = [super init]) {
        _eventTokenMap = eventTokenMap;
    }
    
    return self;
}

- (void)event:(NSString *)event withProperties:(NSDictionary *)properties {
    if(_eventTokenMap && _eventTokenMap[event])
        [Adjust trackEvent:_eventTokenMap[event] withParameters:properties];
}

@end
