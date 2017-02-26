//
//  QDTechUserDetailViewController.h
//  QDTech
//
//  Created by Alessandro dos santos pinto on 2/26/17.
//  Copyright © 2017 Alessandro dos Santos Pinto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QDTechUserItemViewModel.h"
#import "QDTBaseViewController.h"

@interface QDTechUserDetailViewController : QDTBaseViewController

@property (strong, nonatomic) QDTechUserItemViewModel *userModel;

@end
