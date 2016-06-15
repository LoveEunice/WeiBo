//
//  NSString+Status.h
//  04-WeiBo
//
//  Created by qingyun on 16/4/19.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Status)
//从html字符串中提取微博来源
+(instancetype)statusSourceWithHtml:(NSString *)html;
@end
