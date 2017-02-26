//
//  QDTechConnectionClient.h
//  QDTech
//
//  Created by Alessandro dos santos pinto on 2/26/17.
//  Copyright © 2017 Alessandro dos Santos Pinto. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

extern NSString *QDTechClientURL;

@interface QDTechConnectionClient : AFHTTPSessionManager

+ (instancetype)sharedClient;

@end
