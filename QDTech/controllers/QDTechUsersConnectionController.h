//
//  QDTechConnectionController.h
//  QDTech
//
//  Created by Alessandro dos santos pinto on 2/26/17.
//  Copyright © 2017 Alessandro dos Santos Pinto. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *QDTechConnectionControllerErrorDomain;

typedef void (^QDTCompletionHandler)(NSArray *response, NSError *error);

typedef NS_ENUM(NSUInteger, QDTechConnectionControllerErrorCode) {
    QDTechConnectionControllerErrorCodeConnectionProblem,
    QDTechConnectionControllerErrorCodeBadRequest,
    QDTechConnectionControllerErrorCodeServerError,
};

@interface QDTechUsersConnectionController : NSObject

+ (NSURLSessionTask *)loadUsersSession:(NSString *)sessionOption withCompletionHandler
                                      :(QDTCompletionHandler)completionHandler;

+ (void)loadUsersViewModelWithOption:(NSString *)sessionOption withCompletion
                                    :(QDTCompletionHandler)completionHandler;

@end
