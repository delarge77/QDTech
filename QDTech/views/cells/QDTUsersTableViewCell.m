//
//  QDTUsersTableViewCell.m
//  QDTech
//
//  Created by Alessandro dos santos pinto on 2/26/17.
//  Copyright © 2017 Alessandro dos Santos Pinto. All rights reserved.
//

#import "QDTUsersTableViewCell.h"

@interface QDTUsersTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;

@end

@implementation QDTUsersTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) configureCellLayoutWithUserModel:(QDTechUserItemViewModel *)userModel {
    self.nameLabel.text = userModel.name;
    self.usernameLabel.text = userModel.userName;
    self.emailLabel.text = userModel.email;
    self.addressLabel.text = userModel.address;
}

@end
