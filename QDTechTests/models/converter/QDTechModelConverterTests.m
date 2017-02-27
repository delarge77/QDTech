//
//  QDTechModelConverterTests.m
//  QDTech
//
//  Created by Alessandro dos santos pinto on 2/27/17.
//  Copyright © 2017 Alessandro dos Santos Pinto. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "QDTechModelConverter.h"
#import "QDTechUser.h"
#import "QDTechUserAddress.h"
#import "QDTechUserDetail.h"

@interface QDTechDummyClass : NSObject

@end

@implementation QDTechDummyClass

@end

@interface QDTechModelConverterTests : XCTestCase

@end

@implementation QDTechModelConverterTests

- (void)testShouldFailIfNilClassToParseIsUsedForDictionaries {
    XCTAssertThrows([QDTechModelConverter convertModelFromJSON:@{} class:nil], @"Should fail when sending a nil class to convert an dictionary");
}

- (void)testShouldFailIfNilClassToParseIsUsedForArrays {
    XCTAssertThrows([QDTechModelConverter convertModelsFromJSON:@[] class:nil], @"Should fail when sending a nil class to convert an array");
}

- (void)testShouldReturnNilWhenSendingNilDictionaryToConvert {
    XCTAssertNil([QDTechModelConverter convertModelFromJSON:nil class:[QDTechUser class]], @"Should return nil when converting nil dictionary");
    XCTAssertNil([QDTechModelConverter convertModelFromJSON:nil class:[QDTechUserAddress class]], @"Should return nil when converting nil dictionary");
    XCTAssertNil([QDTechModelConverter convertModelFromJSON:nil class:[QDTechUserDetail class]], @"Should return nil when converting nil dictionary");
}

- (void)testShouldReturnNilWhenSendingNilArrayToConvert {
    XCTAssertNil([QDTechModelConverter convertModelsFromJSON:nil class:[QDTechUser class]], @"Should return nil when converting nil array");
    XCTAssertNil([QDTechModelConverter convertModelFromJSON:nil class:[QDTechUserAddress class]], @"Should return nil when converting nil dictionary");
    XCTAssertNil([QDTechModelConverter convertModelFromJSON:nil class:[QDTechUserDetail class]], @"Should return nil when converting nil dictionary");
}

- (void)testShouldReturnEmptyArrayIfEmptyArrayIsSent {
    NSArray *qdtechUserconvertedObject = [QDTechModelConverter convertModelsFromJSON:@[] class:[QDTechUser class]];
    XCTAssertNotNil(qdtechUserconvertedObject, @"Should not be nil when converting empty array");
    XCTAssertTrue(0 == qdtechUserconvertedObject.count, @"");
    
    NSArray *qdtechUserAddressconvertedObject = [QDTechModelConverter convertModelsFromJSON:@[] class:[QDTechUserAddress class]];
    XCTAssertNotNil(qdtechUserAddressconvertedObject, @"Should not be nil when converting empty array");
    XCTAssertTrue(0 == qdtechUserAddressconvertedObject.count, @"");
    
    NSArray *qdtechUserDetailconvertedObject = [QDTechModelConverter convertModelsFromJSON:@[] class:[QDTechUserDetail class]];
    XCTAssertNotNil(qdtechUserDetailconvertedObject, @"Should not be nil when converting empty array");
    XCTAssertTrue(0 == qdtechUserDetailconvertedObject.count, @"");
}

- (void)testShouldReturnNilIfInvalidModelClassIsSent {
    XCTAssertNil([QDTechModelConverter convertModelFromJSON:@{} class:[QDTechDummyClass class]], @"Should return nil if invalid model class is sent");
    XCTAssertNil([QDTechModelConverter convertModelsFromJSON:@[@{}] class:[QDTechDummyClass class]], @"Should return nil if invalid model class is sent");
}

@end
