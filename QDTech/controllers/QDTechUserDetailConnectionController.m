//
//  QDTechUserDetailConnectionClient.m
//  QDTech
//
//  Created by Alessandro dos santos pinto on 2/26/17.
//  Copyright © 2017 Alessandro dos Santos Pinto. All rights reserved.
//

#import "QDTechUserDetailConnectionController.h"
#import "QDTechConnectionClient.h"
#import "MTLJSONAdapter.h"
#import "QDTechUserDetail.h"
#import "NSError+QDTechError.h"

@implementation QDTechUserDetailConnectionController

+ (NSURLSessionTask *)loadUserDetailWithSessionOption:(NSString *)sessionOption withCompletionHandler
                                                     :(QDTCompletionHandler)completionHandler {

    [[[QDTechConnectionClient sharedClient] operationQueue] cancelAllOperations];
    
    return [[QDTechConnectionClient sharedClient] GET:sessionOption parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *error = nil;
        id jsonResponse = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
        NSArray *result = [MTLJSONAdapter modelsOfClass:[QDTechUserDetail class]
                                          fromJSONArray:jsonResponse
                                                  error:&error];
        if (completionHandler) completionHandler(result, nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if ([error.domain isEqualToString:NSURLErrorDomain]) {
            
            error = [NSError qdt_buildConnectionProblemError];
            if (completionHandler) completionHandler(nil, error);
            return;
        }
        
        NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
        if (response.statusCode >= 400 && response.statusCode <= 499) {
            error = [NSError qdt_build400Error];
        }
        if (response.statusCode >= 500 && response.statusCode <= 599) {
            error = [NSError qdt_build500Error];
        }
        
        if (completionHandler) completionHandler(nil, error);
        
    }];
}

@end
