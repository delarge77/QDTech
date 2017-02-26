//
//  QDTechUsers.m
//  QDTech
//
//  Created by Alessandro dos santos pinto on 2/26/17.
//  Copyright © 2017 Alessandro dos Santos Pinto. All rights reserved.
//

#import "QDTechUser.h"
#import <Mantle/NSValueTransformer+MTLPredefinedTransformerAdditions.h>

@implementation QDTechUser

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"userId" : @"id",
             @"name" : @"name",
             @"userName" : @"username",
             @"email" : @"email",
             @"address" : @"address"};
}

+ (NSValueTransformer *)addressJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[QDTechUserAddress class]];
}

@end
