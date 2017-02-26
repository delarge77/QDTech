//
//  ViewController.m
//  QDTech
//
//  Created by Alessandro dos santos pinto on 2/26/17.
//  Copyright © 2017 Alessandro dos Santos Pinto. All rights reserved.
//

#import "QDTechUsersViewController.h"
#import "QDTechUsersConnectionController.h"
#import "QDTUsersTableViewCell.h"
#import "QDTechUserItemViewModel.h"
#import "QDTechUserDetailViewController.h"

@interface QDTechUsersViewController ()

@property (strong, nonatomic) NSArray *userModels;

@end

@implementation QDTechUsersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    typeof(self) weakSelf = self;
    [self showLoadingMessage:NSLocalizedString(@"QDTechUsersViewController.LoadingResults", nil)];
    [QDTechUsersConnectionController loadUsersViewModelWithOption:@"users" withCompletion:^(NSArray *response, NSError *error) {
        [weakSelf dismissHud];
        
        if (error) {
            [self presentError:error inView:self.view];
            return;
        }
        
        weakSelf.userModels = response;
        [weakSelf.tableView reloadData];
    }];
}

#pragma mark - UITableViewDatasource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.userModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cellIdentifier";
    
    QDTUsersTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    QDTechUserItemViewModel *userModel = self.userModels[indexPath.row];
    
    [cell configureCellLayoutWithUserModel:userModel];
    
    return cell;
}

 #pragma mark - Navigation

 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     if ([segue.identifier isEqualToString:@"detailSegue"]) {
         QDTechUserDetailViewController *detailController = (QDTechUserDetailViewController *)segue.destinationViewController ;
         NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
         QDTechUserItemViewModel *user = (QDTechUserItemViewModel *)self.userModels[indexPath.row];
         detailController.userModel = user;
     }
 }

@end
