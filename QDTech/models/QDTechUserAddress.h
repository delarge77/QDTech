//
//  QDTechUserAddress.h
//  QDTech
//
//  Created by Alessandro dos santos pinto on 2/26/17.
//  Copyright © 2017 Alessandro dos Santos Pinto. All rights reserved.
//

#import <Mantle/Mantle.h>

//"address": {
//    "street": "Kulas Light",
//    "suite": "Apt. 556",
//    "city": "Gwenborough",
//    "zipcode": "92998-3874",
//    "geo": {
//        "lat": "-37.3159",
//        "lng": "81.1496"
//    }

@interface QDTechUserAddress : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSString *street;
@property (nonatomic, copy, readonly) NSString *suite;
@property (nonatomic, copy, readonly) NSString *city;
@property (nonatomic, copy, readonly) NSString *zipcode;
@property (nonatomic, readonly) float latitude;
@property (nonatomic, readonly) float longitude;

@end
