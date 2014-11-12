//
//  IntercomProvider.m
//  Pods
//
//  Created by Engin Kurutepe on 12/11/14.
//
//

#import "IntercomProvider.h"
#import <Intercom/Intercom.h>

@implementation IntercomProvider

- (instancetype)initWithIdentifier:(NSString *)identifier andApiKey:(NSString *)key securityOptions:(NSDictionary *)options {

    self = [super initWithIdentifier:identifier];
    
    if (self) {
        [Intercom setApiKey:key forAppId:identifier securityOptions:options];
    }
    
    return self;
}

- (instancetype)initWithIdentifier:(NSString *)identifier andApiKey:(NSString *)key {
    self = [super initWithIdentifier:identifier];
    
    if (self) {
        [Intercom setApiKey:key forAppId:identifier];
    }
    
    return self;
}

- (void)identifyUserWithID:(NSString *)userID andEmailAddress:(NSString *)email {
    [self identifyUserWithID:userID andEmailAddress:email completion:nil];
}

- (void)identifyUserWithID:(NSString *)userID andEmailAddress:(NSString *)email completion:(void (^)(NSError *))completion {
    
    if (userID) {
        [Intercom beginSessionForUserWithUserId:userID completion:completion];
    }
    else if (email) {
        [Intercom beginSessionForUserWithEmail:email completion:completion];
    }
    else {
        [Intercom beginSessionForAnonymousUserWithCompletion:completion];
    }
}

- (void)event:(NSString *)event withProperties:(NSDictionary *)properties {
    [self event:event withProperties:properties completion:nil];
}

- (void)event:(NSString *)event withProperties:(NSDictionary *)properties completion:(void (^)(NSError *))completion {
    [Intercom logEventWithName:event optionalMetaData:properties completion:completion];
}


@end
