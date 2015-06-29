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
    if(event && event.length > 0) {
        
        NSMutableCharacterSet *fbEventsAllowedCharacters = [NSMutableCharacterSet characterSetWithCharactersInString:@"_- "];
        [fbEventsAllowedCharacters formUnionWithCharacterSet:[NSCharacterSet alphanumericCharacterSet]];
        NSCharacterSet *unwantedSet = [fbEventsAllowedCharacters invertedSet];

        event = [[event componentsSeparatedByCharactersInSet:unwantedSet] componentsJoinedByString:@""];
        
        [FBAppEvents logEvent:event parameters:properties];
    }
}

@end
