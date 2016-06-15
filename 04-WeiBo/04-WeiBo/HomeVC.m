//
//  HomeVC.m
//  04-WeiBo
//
//  Created by qingyun on 16/4/19.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "HomeVC.h"
#import "QYStatusModel.h"
#import "QYStatusCell.h"
#import "QYStatusSectionFooterView.h"
@interface HomeVC ()
@property (nonatomic, strong) NSArray *statuses;
@end

@implementation HomeVC
static NSString *identifier = @"statusCell";
static NSString *footerIdentifier = @"statusFooterView";
//懒加载数据statuses
-(NSArray *)statuses{
    if (_statuses == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"temp" ofType:@"plist"];
        NSDictionary *tempDict = [NSDictionary dictionaryWithContentsOfFile:path];
        NSArray *array = tempDict[@"statuses"];
        NSMutableArray *models = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            QYStatusModel *statusModel = [QYStatusModel statusModelWithDictionary:dict];
            [models addObject:statusModel];
        }
        _statuses = models;
    }
    return _statuses;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([QYStatusCell class]) bundle:nil] forCellReuseIdentifier:identifier];
    
    //注册sectionFooterView
    [self.tableView registerClass:[QYStatusSectionFooterView class] forHeaderFooterViewReuseIdentifier:footerIdentifier];
    self.tableView.estimatedRowHeight = 125;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.statuses.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QYStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    QYStatusModel *model = self.statuses[indexPath.section];
    cell.statusModel = model;
    
    return cell;
}

//section的头视图高度
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return section ? 10 : 0.1;
}

//section的尾视图的高度
- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 44;
}

//section的尾视图
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    QYStatusSectionFooterView *footerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:footerIdentifier];
    
    //设置模型数据
    QYStatusModel *statusModel = self.statuses[section];
    footerView.model = statusModel;
    
    return footerView;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
