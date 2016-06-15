//
//  QYStatusSectionFooterView.h
//  04-WeiBo
//
//  Created by qingyun on 16/4/20.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QYStatusModel;
@interface QYStatusSectionFooterView : UITableViewHeaderFooterView
@property (nonatomic, strong) QYStatusModel *model;
@end
