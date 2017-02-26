//
//  QDTechUserAddress.m
//  QDTech
//
//  Created by Alessandro dos santos pinto on 2/26/17.
//  Copyright © 2017 Alessandro dos Santos Pinto. All rights reserved.
//

#import "QDTechUserAddress.h"

@implementation QDTechUserAddress

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"street" : @"street",
             @"suite" : @"suite",
             @"city" : @"city",
             @"zipcode" : @"zipcode",
             @"latitude" : @"geo.lat",
             @"longitude" : @"geo.lng"};
}

+ (NSValueTransformer *) latitudeJSONTransformer
{
    return [self floatTransformer];
}

+ (NSValueTransformer *) longitudeJSONTransformer
{
    return [self floatTransformer];
}

+ (NSValueTransformer<MTLTransformerErrorHandling> *)floatTransformer {
    return [MTLValueTransformer
            transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
                if ([value isKindOfClass:[NSString class]]) {
                    return @([value floatValue]);
                }
                return value;
            } reverseBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
                return value;
            }];
}

@end
