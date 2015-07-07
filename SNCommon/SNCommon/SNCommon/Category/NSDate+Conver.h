//
//  NSDate+Conver.h
//  SNCommon
//
//  Created by sam on 15/6/23.
//  Copyright (c) 2015年 sam. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
	SinceNow,
	SinceReferenceDate,
	Since1970,
} TimeIntervalType;

@interface NSDate (Conver)
/**
 *  @author sam, 15-06-23 11:06:46
 *
 *  timeinterval转换成date
 *
 *  @param style date的style
 *  @param type  timeinterval的类型
 *  @param time  timeinterval具体的值
 *
 *  @return date
 */
+ (NSDate *)TimeIntervalConverDateWithStyle:(NSString *)style AndTimeIntervalType:(TimeIntervalType)type AndTimeInterval:(NSTimeInterval)time;
/**
 *  @author sam, 15-06-23 11:06:37
 *
 *  时间按照格式转换成字符串
 *
 *  @param style 时间的格式
 *
 *  @return 字符串
 */
- (NSString *)DateConverToString:(NSString *)style;
/**
 *  @author sam, 15-06-23 11:06:07
 *
 *  转换时间的style
 *
 *  @param style 时间的格式
 *
 *  @return date
 */
- (NSDate *)DateConverForStyle:(NSString *)style;
/**
 *  @author sam, 15-06-23 11:06:34
 *
 *  时间转换成timeinterval
 *
 *  @param type timeinterval的类型
 *
 *  @return timeinterval
 */
- (NSTimeInterval)DateConverTimeIntervalWithType:(TimeIntervalType)type;

@end
