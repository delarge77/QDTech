//
//  QDTechUserItemViewModel.m
//  QDTech
//
//  Created by Alessandro dos santos pinto on 2/26/17.
//  Copyright © 2017 Alessandro dos Santos Pinto. All rights reserved.
//

#import "QDTechUserItemViewModel.h"
#import "QDTechUserAddress.h"

@implementation QDTechUserItemViewModel

- (instancetype)initWithUserItem:(QDTechUser *)user {
    
    NSParameterAssert(user);
    self = [super init];
    if (self) {
        _userId = [user.userId stringValue];
        _name = user.name;
        _userName = user.userName;
        _email = user.email;
        _address = [self formatUserAddress:user.address];
        _paramDetail = [self formatParamUserDetailWithUserId:[user.userId stringValue]];
    }
    return self;
}

- (NSString *)formatUserAddress:(QDTechUserAddress *)userAddress {
    return [NSString stringWithFormat:@"%@ - %@ - %@ - %@", userAddress.suite, userAddress.street, userAddress.city, userAddress.zipcode];
}

- (NSString *)formatParamUserDetailWithUserId:(NSString *) userId {
    return [NSString stringWithFormat:@"posts?userId=%@", userId];
}

@end
