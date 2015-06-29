//
//  IntercomProvider.h
//  Pods
//
//  Created by Engin Kurutepe on 12/11/14.
//
//

#import "ARAnalyticalProvider.h"

@interface IntercomProvider : ARAnalyticalProvider

- (instancetype)initWithIdentifier:(NSString *)identifier andApiKey:(NSString *)key;
- (instancetype)initWithIdentifier:(NSString *)identifier andApiKey:(NSString *)key securityOptions:(NSDictionary *)options;
- (void)identifyUserWithID:(NSString *)userID andEmailAddress:(NSString *)email;
- (void)event:(NSString *)event withProperties:(NSDictionary *)properties completion:(void(^)(NSError *error))completion;

@end
