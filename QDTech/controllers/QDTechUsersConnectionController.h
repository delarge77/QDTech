//
//  QDTechConnectionController.h
//  QDTech
//
//  Created by Alessandro dos santos pinto on 2/26/17.
//  Copyright © 2017 Alessandro dos Santos Pinto. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^QDTCompletionHandler)(NSArray *response, NSError *error);

@interface QDTechUsersConnectionController : NSObject

+ (NSURLSessionTask *)loadUsersSession:(NSString *)sessionOption withCompletionHandler
                                      :(QDTCompletionHandler)completionHandler;

+ (NSURLSessionTask *)loadUsersViewModelWithOption:(NSString *)sessionOption withCompletion
                                    :(QDTCompletionHandler)completionHandler;

@end
