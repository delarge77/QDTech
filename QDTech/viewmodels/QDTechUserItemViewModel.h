//
//  QDTechUserItemViewModel.h
//  QDTech
//
//  Created by Alessandro dos santos pinto on 2/26/17.
//  Copyright © 2017 Alessandro dos Santos Pinto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QDTechUser.h"


@interface QDTechUserItemViewModel : NSObject

@property (nonatomic, copy, readonly) NSString *userId;
@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *userName;
@property (nonatomic, copy, readonly) NSString *email;
@property (nonatomic, copy, readonly) NSString *address;
@property (nonatomic, copy, readonly) NSString *paramDetail;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithUserItem:(QDTechUser *)user NS_DESIGNATED_INITIALIZER;;

@end
