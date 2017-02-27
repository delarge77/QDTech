//
//  QDTechUserDetailViewController.m
//  QDTech
//
//  Created by Alessandro dos santos pinto on 2/26/17.
//  Copyright © 2017 Alessandro dos Santos Pinto. All rights reserved.
//

#import "QDTechUserDetailViewController.h"
#import "QDTechUserDetailConnectionController.h"
#import "QDTechUserDetail.h"
#import "QDTUserDetailTableViewCell.h"

@interface QDTechUserDetailViewController ()

@property (strong, nonatomic) NSArray *userDetailModels;

@end

@implementation QDTechUserDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = self.userModel.name;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    typeof(self) weakSelf = self;
    [self showLoadingMessage:NSLocalizedString(@"QDTechUserDetailViewController.LoadingDetailResults", nil)];
    
    [QDTechUserDetailConnectionController loadUserDetailWithSessionOption:self.userModel.paramDetail withCompletionHandler:^(NSArray *response, NSError *error) {
        [weakSelf dismissHud];
        
        if (error) {
            [self presentError:error inView:self.view];
            return;
        }
        
        weakSelf.userDetailModels = response;
        [weakSelf.tableView reloadData];
        
        weakSelf.tableView.estimatedRowHeight = 120.0f;
        weakSelf.tableView.rowHeight = UITableViewAutomaticDimension;
 
    }];
}

#pragma mark - UITableViewDatasource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.userDetailModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cellIdentifier";
    
    QDTUserDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    QDTechUserDetail *detail = self.userDetailModels[indexPath.row];
    
    [cell configureCellLayoutWithUserDetail:detail];
    
    return cell;
}

@end
