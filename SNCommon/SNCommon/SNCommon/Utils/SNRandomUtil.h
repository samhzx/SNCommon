//
//  RandomUtil.h
//  SNCommon
//
//  Created by sam on 15/6/23.
//  Copyright (c) 2015年 sam. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
	UPPERCASE,
	LOWERCASE,
} CharCase;

@interface SNRandomUtil : NSObject
/**
 *  @author sam, 15-06-23 08:06:48
 *
 *  产生随机数组
 *
 *  @param startNumber 开始的数字
 *  @param count       数组需要多少个元素
 *
 *  @return 产生随机数字的数组
 */
+ (NSArray *)RandomNumberArrayWithStartNumber:(NSInteger)startNumber AndCount:(NSInteger)count;
/**
 *  @author sam, 15-06-23 08:06:21
 *
 *  产生一个随机字母的数组
 *
 *  @param charcase 枚举类型，大写字母或者小写字母
 *  @param count    数组元素的总数
 *
 *  @return 产生随机字母的数组
 */
+ (NSArray *)RandomCharArrayWithCase:(CharCase)charcase AndCount:(NSInteger)count;
@end
