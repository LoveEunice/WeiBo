//
//  QYStatusModel.m
//  04-WeiBo
//
//  Created by qingyun on 16/4/19.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYStatusModel.h"
#import "Common.h"
#import "NSDate+Status.h"
#import "NSString+Status.h"
#import "QYUserModel.h"
@implementation QYStatusModel

+(instancetype)statusModelWithDictionary:(NSDictionary *)statusInfo{
    return [[self alloc] initWithDictionary:statusInfo];
}

-(instancetype)initWithDictionary:(NSDictionary *)statusInfo{
    if (self = [super init]) {
        //微博的创建时间
        NSString *createdString = statusInfo[kStatusCreatAt];
        NSDate *createdDate = [NSDate statusDateWithString:createdString];
        _createdAt = [self createdStringWithDate:createdDate];
        //微博id
        _statusId = statusInfo[kStatusId];
        //内容
        _text = statusInfo[kStatusText];
        //来源
        NSString *sourceHtml = statusInfo[kStatusSource];
        _source = [NSString statusSourceWithHtml:sourceHtml];
        //用户信息
        NSDictionary *userDict = statusInfo[kStatusUser];
        _user = [QYUserModel userWithDictionary:userDict];
        //转发的微博
        NSDictionary *reStatusDict = statusInfo[kStatusRetweetedStatus];
        if (reStatusDict) {
            _retweetedStatus = [QYStatusModel statusModelWithDictionary:reStatusDict];
        }
        //微博图片集合
        _picUrls = statusInfo[kStatusPicUrls];
        //转发数
        _repostsCount = [statusInfo[kStatusRepostsCount] integerValue];
        //评论数
        _commentsCount = [statusInfo[kStatusCommentsCount] integerValue];
        //表态数
        _attitudesCount = [statusInfo[kStatusAttitudesCount] integerValue];
    }
    return self;
}
//根据时间转化显示的时间级别
-(NSString *)createdStringWithDate:(NSDate *)date{
    //1、计算时间差（date和当前时间差）
    NSTimeInterval interval = -[date timeIntervalSinceNow];
    //2、根据时间差确定时间显示的级别（秒、分、时、天、日期）
    if (interval < 60) {//秒
        return [NSString stringWithFormat:@"刚刚 %d 秒前",(int)interval];
    }else if (interval < 60 * 60){//分
        return [NSString stringWithFormat:@"刚刚 %d 分前",(int)interval / 60];
    }else if (interval < 60 * 60 * 24){//时
        return [NSString stringWithFormat:@"刚刚 %d 时前",(int)interval / (60 * 60)];
    }else if (interval < 60 * 60 * 24 * 30){//天
        return [NSString stringWithFormat:@"刚刚 %d 天前",(int)interval / (60 * 60 *24)];
    }else{
        
        //直接格式化成日期
        /*
        NSDateFormatterStyle取值
         NSDateFormatterNoStyle 
         例如:(空白)
         NSDateFormatterShortStyle
         例如: 下午 7:00   |   16/4/19
         NSDateFormatterMediumStyle
         例如: 下午 7:00:00   |    2016年4月19日
         NSDateFormatterLongStyle
         例如: GMT +8 下午 7:00:00    |  2016年4月19日
         NSDateFormatterFullStyle
         例如: 中国标准时间下午7:00:00    |  2016年4月19日 星期二
         */
        
        return [NSDateFormatter localizedStringFromDate:date dateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterNoStyle];
    }
}

@end
