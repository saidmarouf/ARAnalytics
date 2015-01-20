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
@property (nonatomic, weak) id adjustDelegate;
@end


@implementation AdjustProvider

static ADJConfig *sharedAdjustConfigurator = nil;

- (id)initWithIdentifier:(NSString *)identifier eventTokenMap:(NSDictionary *)eventTokenMap {
    NSAssert([Adjust class], @"Adjust is not included");
    
#if defined (DEBUG)
    sharedAdjustConfigurator = [ADJConfig configWithAppToken:identifier environment:ADJEnvironmentSandbox];
#else
    sharedAdjustConfigurator = [ADJConfig configWithAppToken:identifier environment:ADJEnvironmentProduction];
#endif
    
    if(self = [super init]) {
        _eventTokenMap = eventTokenMap;
    }
    
    return self;
}

- (void)event:(NSString *)event withProperties:(NSDictionary *)properties {
    if(_eventTokenMap && _eventTokenMap[event]) {
        ADJEvent *e = [ADJEvent eventWithEventToken:_eventTokenMap[event]];
        if(properties) {
            for (NSString *pKey in properties) {
                if(properties[pKey] && properties[pKey] != [NSNull null])
                    [e addCallbackParameter:pKey value:properties[pKey]];
            }
        }
        [Adjust trackEvent:e];
    }
}

+ (void) setAdjustDelegate:(id<AdjustDelegate>) delegate {
    [sharedAdjustConfigurator setDelegate:delegate];
}

+ (void) appDidLaunch {
    [Adjust appDidLaunch:sharedAdjustConfigurator];
}

@end
