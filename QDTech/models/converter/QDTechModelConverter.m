//
//  QDTechModelConverter.m
//  QDTech
//
//  Created by Alessandro dos santos pinto on 2/26/17.
//  Copyright © 2017 Alessandro dos Santos Pinto. All rights reserved.
//

#import "QDTechModelConverter.h"
#import "MTLJSONAdapter.h"

@implementation QDTechModelConverter

+ (id)convertModelFromJSON:(NSDictionary *)JSON class:(Class)classToParse {
    NSParameterAssert(classToParse != nil);
    
    @try {
        NSError *error = nil;
        id object = [MTLJSONAdapter modelOfClass:classToParse
                              fromJSONDictionary:JSON
                                           error:&error];
        if (!error) {
            return object;
        } else {
            return nil;
        }
    }
    @catch (NSException *exception) {
        return nil;
    }
}

+ (NSArray *)convertModelsFromJSON:(NSArray *)JSON class:(Class)classToParse {
    NSParameterAssert(classToParse != nil);
    
    @try {
        NSError *error = nil;
        NSArray *objects = [MTLJSONAdapter modelsOfClass:classToParse
                                           fromJSONArray:JSON
                                                   error:&error];
        if (!error) {
            return objects;
        } else {
            return nil;
        }
    }
    @catch (NSException *exception) {
        return nil;
    }
}

@end
