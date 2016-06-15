//
//  QYUserModel.h
//  04-WeiBo
//
//  Created by qingyun on 16/4/19.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>


/*
 idstr	string	字符串型的用户UID
 screen_name	string	用户昵称
 name	string	友好显示名称
 profile_image_url	string	用户头像地址（中图），50×50像素
 avatar_large	string	用户头像地址（大图），180×180像素
 avatar_hd	string	用户头像地址（高清），高清头像原图
 followers_count	int	粉丝数
 friends_count	int	关注数
 statuses_count	int	微博数
 favourites_count int	收藏数
 */
@interface QYUserModel : NSObject

@property (nonatomic, strong) NSString *idStr;
@property (nonatomic, strong) NSString *screenName;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *profileImageUrl;
@property (nonatomic, strong) NSString *avatarLarge;
@property (nonatomic, strong) NSString *avatarHD;
@property (nonatomic)         NSInteger followersCount;
@property (nonatomic)         NSInteger friendsCount;
@property (nonatomic)         NSInteger statusesCount;
@property (nonatomic)         NSInteger favouritesCount;


-(instancetype)initWithDictionary:(NSDictionary *)userInfo;
+(instancetype)userWithDictionary:(NSDictionary *)userInfo;
@end
