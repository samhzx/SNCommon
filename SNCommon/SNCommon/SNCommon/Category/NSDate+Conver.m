//
//  NSDate+Conver.m
//  SNCommon
//
//  Created by sam on 15/6/23.
//  Copyright (c) 2015年 sam. All rights reserved.
//

#import "NSDate+Conver.h"

@implementation NSDate (Conver)
- (NSString *)DateConverToString:(NSString *)style {
	if ([style isKindOfClass:[NSNull class]]) {
		style = @"yyyy-MM-dd HH:mm:ss";
	}
	NSDateFormatter *fm = [NSDateFormatter new];
	[fm setDateFormat:style];
	return [fm stringFromDate:self];
}

- (NSDate *)DateConverForStyle:(NSString *)style {
	if ([style isKindOfClass:[NSNull class]]) {
		style = @"yyyy-MM-dd HH:mm:ss";
	}
	NSDateFormatter *fm = [NSDateFormatter new];
	[fm setDateFormat:style];
	return [fm dateFromString:[fm stringFromDate:self]];
}

- (NSTimeInterval)DateConverTimeIntervalWithType:(TimeIntervalType)type {
	NSTimeInterval timeinterval = 0;
	switch (type) {
		case SinceNow:
			timeinterval = self.timeIntervalSinceNow;
			break;

		case Since1970:
			timeinterval = self.timeIntervalSince1970;
			break;

		case SinceReferenceDate:
			timeinterval = self.timeIntervalSinceReferenceDate;
			break;

		default:
			break;
	}
	return timeinterval;
}

+ (NSDate *)TimeIntervalConverDateWithStyle:(NSString *)style AndTimeIntervalType:(TimeIntervalType)type AndTimeInterval:(NSTimeInterval)time {
	if ([style isKindOfClass:[NSNull class]]) {
		style = @"yyyy-MM-dd HH:mm:ss";
	}
	NSDateFormatter *fm = [NSDateFormatter new];
	[fm setDateFormat:style];
	NSDate *date = nil;
	switch (type) {
		case SinceNow:
			date = [NSDate dateWithTimeIntervalSinceNow:time];
			break;

		case Since1970:
			date = [NSDate dateWithTimeIntervalSince1970:time];
			break;

		case SinceReferenceDate:
			date = [NSDate dateWithTimeIntervalSinceReferenceDate:time];
			break;

		default:
			break;
	}
	return [fm dateFromString:[fm stringFromDate:date]];
}

@end
