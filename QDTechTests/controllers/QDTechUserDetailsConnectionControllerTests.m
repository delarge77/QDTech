//
//  QDTechUserDetailsConnectionControllerTests.m
//  QDTech
//
//  Created by Alessandro dos santos pinto on 2/27/17.
//  Copyright © 2017 Alessandro dos Santos Pinto. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OHHTTPStubs/OHHTTPStubsResponse+JSON.h>
#import <OHHTTPStubs/OHPathHelpers.h>
#import "OHHTTPStubs.h"
#import "QDTechUserDetailConnectionController.h"
#import "NSError+QDTechError.h"
#import "QDTechUserDetail.h"

@interface QDTechUserDetailsConnectionControllerTests : XCTestCase

@end

@implementation QDTechUserDetailsConnectionControllerTests

- (void)testShouldReturnBadRequestWhen4xxStatusCodeIsReturned {
    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
        return [request.URL.absoluteString rangeOfString:@"posts?userId=1"].location != NSNotFound;
    } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
        return [OHHTTPStubsResponse responseWithData:[NSData data] statusCode:400 headers:nil];
    }];
    
//    XCTestExpectation *expectation = [self expectationWithDescription:@"Should return invalid error request for error 4xx"];
//    NSURLSessionTask *task = [QDTechUserDetailConnectionController loadUserDetailWithSessionOption:@"users" withCompletion:^(NSArray *response, NSError *error) {
//        XCTAssertNil(response);
//        XCTAssertNotNil(error);
//        XCTAssertEqual(error.code, QDTechConnectionControllerErrorCodeBadRequest);
//        XCTAssertEqualObjects(error.domain, QDTechConnectionControllerErrorDomain);
//        XCTAssertEqualObjects(error.userInfo[NSLocalizedDescriptionKey], NSLocalizedString(@"QDTechUsersViewController.build400Error", nil));
//        [expectation fulfill];
//        
//    }];
//    
    
    [self waitForExpectationsWithTimeout:task.originalRequest.timeoutInterval handler:^(NSError *error) {
        [task cancel];
    }];
}

- (void)testShouldReturnServerErrorWhen5xxStatusCodeIsReturned {
    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
        return [request.URL.absoluteString rangeOfString:@"posts?userId=1"].location != NSNotFound;
    } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
        return [OHHTTPStubsResponse responseWithData:[NSData data] statusCode:500 headers:nil];
    }];
    
//    XCTestExpectation *expectation = [self expectationWithDescription:@"Should return invalid error request for error 5xx"];
//    NSURLSessionTask *task = [loadUserDetailWithSessionOption loadUserDetailWithSessionOption:@"users" withCompletion:^(NSArray *response, NSError *error) {
//        XCTAssertNil(response);
//        XCTAssertNotNil(error);
//        XCTAssertEqual(error.code, QDTechConnectionControllerErrorCodeServerError);
//        XCTAssertEqualObjects(error.domain, QDTechConnectionControllerErrorDomain);
//        XCTAssertEqualObjects(error.userInfo[NSLocalizedDescriptionKey], NSLocalizedString(@"QDTechUsersViewController.build500Error", nil));
//        
//        [expectation fulfill];
//        
//    }];
    
    [self waitForExpectationsWithTimeout:task.originalRequest.timeoutInterval handler:^(NSError *error) {
        [task cancel];
    }];
    
}

- (void)testShouldReturnConnectionErrorWhenURLErrorDomainIsReturned {
    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
        return [request.URL.absoluteString rangeOfString:@"posts?userId=1"].location != NSNotFound;
    } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
        NSError *notConnectedError = [NSError errorWithDomain:NSURLErrorDomain
                                                         code:kCFURLErrorNotConnectedToInternet
                                                     userInfo:nil];
        return [OHHTTPStubsResponse responseWithError:notConnectedError];
    }];
    
//    XCTestExpectation *expectation = [self expectationWithDescription:@"Should return connection error when not connected"];
//    NSURLSessionTask *task = [loadUserDetailWithSessionOption loadUserDetailWithSessionOption:@"users" withCompletion:^(NSArray *response, NSError *error) {
//        XCTAssertNil(response);
//        XCTAssertNotNil(error);
//        XCTAssertEqual(error.code, QDTechConnectionControllerErrorCodeConnectionProblem);
//        XCTAssertEqualObjects(error.domain, QDTechConnectionControllerErrorDomain);
//        XCTAssertEqualObjects(error.userInfo[NSLocalizedDescriptionKey], NSLocalizedString(@"QDTechUsersViewController.buildConnectionProblemError", nil));
//        
//        [expectation fulfill];
//    }];
    
    [self waitForExpectationsWithTimeout:task.originalRequest.timeoutInterval handler:^(NSError *error) {
        [task cancel];
    }];
    
}

- (void)testShouldBeAbleToParseAndReturnSessions {
    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
        return [request.URL.absoluteString rangeOfString:@"posts?userId=1"].location != NSNotFound;
    } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
        return [OHHTTPStubsResponse responseWithFileAtPath:OHPathForFile(@"/tickets.json",self.class)
                                                statusCode:200 headers:@{@"Content-Type":@"application/json"}];
    }];
    
//    XCTestExpectation *expectation = [self expectationWithDescription:@"Should be able to parse and return sessions"];
//    NSURLSessionTask *task = [QDTechUsersConnectionController loadUserDetailWithSessionOption:@"users" withCompletion:^(NSArray *response, NSError *error) {
//        XCTAssertNil(error, @"Should be able to parse sessions without an error");
//        XCTAssertEqual(1, response.count, @"should be able to parse all 6 sessions inside the fixture");
//        NSMutableArray *sessionArray = [NSMutableArray array];
//        for (QDTechUserDetail *item in response) {
//            [sessionArray addObject:item];
//        }
//        [sessionArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//            XCTAssertTrue([obj isKindOfClass:[QDTechUserDetail class]], @"Should have only QDTechUserItemViewModel objects inside response");
//        }];
//        [expectation fulfill];
//        
//    }];
//    
//    [self waitForExpectationsWithTimeout:task.originalRequest.timeoutInterval handler:^(NSError *error) {
//        [task cancel];
//    }];
}

@end
