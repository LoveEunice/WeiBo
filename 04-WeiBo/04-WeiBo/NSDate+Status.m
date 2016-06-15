//
//  NSDate+Status.m
//  04-WeiBo
//
//  Created by qingyun on 16/4/19.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "NSDate+Status.h"

@implementation NSDate (Status)
//Mon Dec 28 13:34:03 +0800 2015
+(instancetype)statusDateWithString:(NSString *)dateString{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"EEE MMM dd HH:mm:ss zzz yyyy";
    //不加下面这行，有可能时间格式化有误
    formatter.locale = [NSLocale localeWithLocaleIdentifier:@"en"];
    NSDate *dat = [formatter dateFromString:dateString];
    return dat;
}
@end
