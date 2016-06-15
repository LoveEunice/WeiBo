//
//  QYUserModel.m
//  04-WeiBo
//
//  Created by qingyun on 16/4/19.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYUserModel.h"
#import "Common.h"
@implementation QYUserModel
+(instancetype)userWithDictionary:(NSDictionary *)userInfo{
    return [[self alloc]initWithDictionary:userInfo];
}
-(instancetype)initWithDictionary:(NSDictionary *)userInfo{
    if (self = [super init]) {
        //用户id
        _idStr = userInfo[kUserId];
        //昵称
        _screenName = userInfo[kUserScreenName];
        //友好显示的名称
        _name = userInfo[kUserName];
        //用户头像（50 * 50）
        _profileImageUrl = userInfo[kUserProfileImageUrl];
        //大图（180 * 180）
        _avatarLarge = userInfo[kUserAvatarLarge];
        //高清（1024 * 1024）
        _avatarHD = userInfo[kUserAvatarHD];
        //粉丝数
        _followersCount = [userInfo[kUserFollowersCount] integerValue];
        //关注数
        _friendsCount = [userInfo[kUserFriendsCount] integerValue];
        //微博数
        _statusesCount = [userInfo[kUserStatusesCount] integerValue];
        //收藏数
        _favouritesCount = [userInfo[kUserFavouritesCount] integerValue];
    }
    return self;
}

@end
