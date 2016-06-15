//
//  QYStatusModel.h
//  04-WeiBo
//
//  Created by qingyun on 16/4/19.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
@class QYUserModel;
/*
 created_at	string	微博创建时间
 idstr	string	字符串型的微博ID
 text	string	微博信息内容
 source	string	微博来源
 user	object	微博作者的用户信息字段 详细
 retweeted_status	object	被转发的原微博信息字段，当该微博为转发微博时返回 详细
 pic_urls        array  微博图片集合
 reposts_count	int	转发数
 comments_count	int	评论数
 attitudes_count	int	表态数
 
 */
@interface QYStatusModel : NSObject

@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, strong) NSString *statusId;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *source;
@property (nonatomic, strong) QYUserModel *user;
@property (nonatomic, strong) QYStatusModel *retweetedStatus;
@property (nonatomic, strong) NSArray *picUrls;
@property (nonatomic)         NSInteger repostsCount;
@property (nonatomic)         NSInteger commentsCount;
@property (nonatomic)         NSInteger attitudesCount;

+(instancetype)statusModelWithDictionary:(NSDictionary *)statusInfo;
-(instancetype)initWithDictionary:(NSDictionary *)statusInfo;

@end
