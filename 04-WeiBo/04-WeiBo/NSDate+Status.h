//
//  NSDate+Status.h
//  04-WeiBo
//
//  Created by qingyun on 16/4/19.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Status)
//把微博给的时间字符串转化成NSDate
+(instancetype)statusDateWithString:(NSString *)dateString;
@end
