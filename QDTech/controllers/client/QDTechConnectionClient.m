//
//  QDTechConnectionClient.m
//  QDTech
//
//  Created by Alessandro dos santos pinto on 2/26/17.
//  Copyright © 2017 Alessandro dos Santos Pinto. All rights reserved.
//

#import "QDTechConnectionClient.h"
#import "AFNetworkActivityIndicatorManager.h"

NSString *QDTechClientURL = @"https://jsonplaceholder.typicode.com/";

@implementation QDTechConnectionClient

+ (instancetype)sharedClient {
    static QDTechConnectionClient * _sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[QDTechConnectionClient alloc] initWithBaseURL:[NSURL URLWithString:QDTechClientURL]];
        [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    });
    
    return _sharedClient;
}

- (instancetype)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (self) {
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
        self.responseSerializer = [AFHTTPResponseSerializer serializer];
        self.requestSerializer.timeoutInterval = 5.0f;
    }
    
    return self;
}

@end
