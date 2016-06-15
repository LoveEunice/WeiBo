//
//  NSString+Status.m
//  04-WeiBo
//
//  Created by qingyun on 16/4/19.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "NSString+Status.h"

@implementation NSString (Status)
+(instancetype)statusSourceWithHtml:(NSString *)html{
    //<a href="http://weibo.com/" rel="nofollow">微博 weibo.com</a>
    if (html.length == 0) {
        return nil;
    }
    //正则表达式的规则
    NSString *regexSring = @">.*<";
    NSError *error = nil;
    //创建一个正则表达式对象
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:regexSring options:NSRegularExpressionCaseInsensitive error:&error];
    //利用正则表达是来进行对比
    NSTextCheckingResult *result = [regularExpression firstMatchInString:html options:NSMatchingReportProgress range:NSMakeRange(0, html.length)];
    if (result) {
        NSRange range = NSMakeRange(result.range.location + 1, result.range.length - 2);
        return [html substringWithRange:range];
    }
    return nil;
}
@end
