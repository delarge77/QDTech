//
//  NSError+QDTechError.m
//  QDTech
//
//  Created by Alessandro dos santos pinto on 2/26/17.
//  Copyright © 2017 Alessandro dos Santos Pinto. All rights reserved.
//

#import "NSError+QDTechError.h"
NSString *QDTechConnectionControllerErrorDomain = @"com.qdtechtest:QDTechConnectionControllerErrorDomain";

@implementation NSError (QDTechError)

+ (NSError *)qdt_buildConnectionProblemError {
    NSDictionary *userInfo =
    @{NSLocalizedDescriptionKey : NSLocalizedString(@"QDTechUsersViewController.buildConnectionProblemError", nil)};
    
    return [NSError errorWithDomain:QDTechConnectionControllerErrorDomain
                               code:QDTechConnectionControllerErrorCodeConnectionProblem
                           userInfo:userInfo];
}

+ (NSError *)qdt_build400Error {
    NSDictionary *userInfo =
    @{NSLocalizedDescriptionKey : NSLocalizedString(@"QDTechUsersViewController.build400Error", nil)};
    
    return [NSError errorWithDomain:QDTechConnectionControllerErrorDomain
                               code:QDTechConnectionControllerErrorCodeBadRequest
                           userInfo:userInfo];
}

+ (NSError *)qdt_build500Error {
    NSDictionary *userInfo =
    @{NSLocalizedDescriptionKey :
          NSLocalizedString(@"QDTechUsersViewController.build500Error", nil)};
    
    return [NSError errorWithDomain:QDTechConnectionControllerErrorDomain
                               code:QDTechConnectionControllerErrorCodeServerError
                           userInfo:userInfo];
}

@end
