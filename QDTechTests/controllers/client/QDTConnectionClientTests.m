//
//  QDTConnectionClientTests.m
//  QDTech
//
//  Created by Alessandro dos santos pinto on 2/27/17.
//  Copyright © 2017 Alessandro dos Santos Pinto. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "QDTechConnectionClient.h"

@interface QDTConnectionClientTests : XCTestCase

@end

@implementation QDTConnectionClientTests

- (void)testAsynchronousURLConnectionForUsers {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Should be able to make requests"];
    NSString *path = @"users";
    
    NSURLSessionDataTask *task = [[QDTechConnectionClient sharedClient] GET:path
                                                                      parameters:nil
                                                                        progress:^(NSProgress * _Nonnull downloadProgress) {
                                                                            
                                                                        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                                                            XCTAssertNotNil(responseObject, "Should not have nil response");
                                                                            
                                                                            NSURLResponse *response = task.response;
                                                                            if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
                                                                                NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                                                                                XCTAssertEqual(200, httpResponse.statusCode, @"Should have 200 status code response");
                                                                                
                                                                                NSString *url = httpResponse.URL.absoluteString;
                                                                                BOOL containsURLClient = [url rangeOfString:QDTechClientURL].location != NSNotFound;
                                                                                XCTAssertTrue(containsURLClient, @"Should request to the right URL");
                                                                                
                                                                                BOOL containsPath = [url rangeOfString:path].location != NSNotFound;
                                                                                XCTAssertTrue(containsPath, @"Should contains path when requesting");
                                                                                
                                                                                XCTAssertEqualObjects(httpResponse.MIMEType, @"application/json", @"Should have right MIMEType when requesting");
                                                                            } else {
                                                                                XCTFail(@"Response was not NSHTTPURLResponse");
                                                                            }
                                                                            
                                                                            [expectation fulfill];
                                                                            
                                                                        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                                                            XCTFail(@"Should not fail when requesting");
                                                                        }];
    
    [self waitForExpectationsWithTimeout:task.originalRequest.timeoutInterval handler:^(NSError *error) {
        [task cancel];
    }];
}

- (void)testAsynchronousURLConnectionForUserDetails {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Should be able to make requests"];
    NSString *path = @"posts?userId=1";
    
    NSURLSessionDataTask *task = [[QDTechConnectionClient sharedClient] GET:path
                                                                 parameters:nil
                                                                   progress:^(NSProgress * _Nonnull downloadProgress) {
                                                                       
                                                                   } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                                                       XCTAssertNotNil(responseObject, "Should not have nil response");
                                                                       
                                                                       NSURLResponse *response = task.response;
                                                                       if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
                                                                           NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                                                                           XCTAssertEqual(200, httpResponse.statusCode, @"Should have 200 status code response");
                                                                           
                                                                           NSString *url = httpResponse.URL.absoluteString;
                                                                           BOOL containsURLClient = [url rangeOfString:QDTechClientURL].location != NSNotFound;
                                                                           XCTAssertTrue(containsURLClient, @"Should request to the right URL");
                                                                           
                                                                           BOOL containsPath = [url rangeOfString:path].location != NSNotFound;
                                                                           XCTAssertTrue(containsPath, @"Should contains path when requesting");
                                                                           
                                                                           XCTAssertEqualObjects(httpResponse.MIMEType, @"application/json", @"Should have right MIMEType when requesting");
                                                                       } else {
                                                                           XCTFail(@"Response was not NSHTTPURLResponse");
                                                                       }
                                                                       
                                                                       [expectation fulfill];
                                                                       
                                                                   } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                                                       XCTFail(@"Should not fail when requesting");
                                                                   }];
    
    [self waitForExpectationsWithTimeout:task.originalRequest.timeoutInterval handler:^(NSError *error) {
        [task cancel];
    }];
}

@end
