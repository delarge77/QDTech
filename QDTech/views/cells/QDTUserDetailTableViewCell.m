//
//  QDTUserDetailTableViewCell.m
//  QDTech
//
//  Created by Alessandro dos santos pinto on 2/26/17.
//  Copyright © 2017 Alessandro dos Santos Pinto. All rights reserved.
//

#import "QDTUserDetailTableViewCell.h"

@interface QDTUserDetailTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *postTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *postDetailLabel;

@end

@implementation QDTUserDetailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) configureCellLayoutWithUserDetailModel:(QDTechUserDetail *) userDetailModel {
    self.postTitleLabel.text = userDetailModel.title;
    self.postDetailLabel.text = userDetailModel.body;
}



@end
