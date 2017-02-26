//
//  NSError+QDTechError.h
//  QDTech
//
//  Created by Alessandro dos santos pinto on 2/26/17.
//  Copyright © 2017 Alessandro dos Santos Pinto. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *QDTechConnectionControllerErrorDomain;

typedef NS_ENUM(NSUInteger, QDTechConnectionControllerErrorCode) {
    QDTechConnectionControllerErrorCodeConnectionProblem,
    QDTechConnectionControllerErrorCodeBadRequest,
    QDTechConnectionControllerErrorCodeServerError,
};

@interface NSError (QDTechError)

+ (NSError *)qdt_buildConnectionProblemError;
+ (NSError *)qdt_build400Error;
+ (NSError *)qdt_build500Error;

@end
