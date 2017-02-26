//
//  QDTechConnectionController.m
//  QDTech
//
//  Created by Alessandro dos santos pinto on 2/26/17.
//  Copyright © 2017 Alessandro dos Santos Pinto. All rights reserved.
//

#import "QDTechUsersConnectionController.h"
#import "QDTechConnectionClient.h"
#import "MTLJSONAdapter.h"
#import "QDTechUser.h"
#import "QDTechUserItemViewModel.h"

NSString *QDTechConnectionControllerErrorDomain = @"com.qdtechtest:QDTechConnectionControllerErrorDomain";

@implementation QDTechUsersConnectionController

+ (NSURLSessionTask *)loadUsersSession:(NSString *)sessionOption withCompletionHandler
                                      :(QDTCompletionHandler)completionHandler {

    [[[QDTechConnectionClient sharedClient] operationQueue] cancelAllOperations];
    
    return [[QDTechConnectionClient sharedClient] GET:sessionOption parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *error = nil;
        id jsonResponse = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
        NSArray *result = [MTLJSONAdapter modelsOfClass:[QDTechUser class]
                                          fromJSONArray:jsonResponse
                                                  error:&error];
        if (completionHandler) completionHandler(result, nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if ([error.domain isEqualToString:NSURLErrorDomain]) {
            
            error = [self buildConnectionProblemError];
            if (completionHandler) completionHandler(nil, error);
            return;
        }
        
        NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
        if (response.statusCode >= 400 && response.statusCode <= 499) {
            error = [self build400Error];
        }
        if (response.statusCode >= 500 && response.statusCode <= 599) {
            error = [self build500Error];
        }
        
        if (completionHandler) completionHandler(nil, error);
        
    }];
}


+ (void)loadUsersViewModelWithOption:(NSString *)sessionOption withCompletion
                                    :(QDTCompletionHandler)completionHandler {

    [QDTechUsersConnectionController loadUsersSession:sessionOption withCompletionHandler:^(NSArray *response, NSError *error) {
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        } else {
            
            NSMutableArray *viewModels = [NSMutableArray array];
            
            for (QDTechUser *user in response) {
                
                QDTechUserItemViewModel *viewModel = [[QDTechUserItemViewModel alloc] initWithUserItem:user];
                
                if (viewModel) {
                    [viewModels addObject:viewModel];
                }
            }
            
            if (completionHandler) {
                completionHandler([viewModels copy], nil);
            }
        }
    }];
}


+ (NSError *)buildConnectionProblemError {
    NSDictionary *userInfo =
    @{NSLocalizedDescriptionKey : NSLocalizedString(@"QDTechUsersViewController.buildConnectionProblemError", nil)};
    
    return [NSError errorWithDomain:QDTechConnectionControllerErrorDomain
                               code:QDTechConnectionControllerErrorCodeConnectionProblem
                           userInfo:userInfo];
}

+ (NSError *)build400Error {
    NSDictionary *userInfo =
    @{NSLocalizedDescriptionKey : NSLocalizedString(@"QDTechUsersViewController.build400Error", nil)};
    
    return [NSError errorWithDomain:QDTechConnectionControllerErrorDomain
                               code:QDTechConnectionControllerErrorCodeBadRequest
                           userInfo:userInfo];
}

+ (NSError *)build500Error {
    NSDictionary *userInfo =
    @{NSLocalizedDescriptionKey :
          NSLocalizedString(@"QDTechUsersViewController.build500Error", nil)};
    
    return [NSError errorWithDomain:QDTechConnectionControllerErrorDomain
                               code:QDTechConnectionControllerErrorCodeServerError
                           userInfo:userInfo];
}

@end
