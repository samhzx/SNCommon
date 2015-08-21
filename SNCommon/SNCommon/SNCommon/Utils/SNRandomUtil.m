//
//  RandomUtil.m
//  SNCommon
//
//  Created by sam on 15/6/23.
//  Copyright (c) 2015年 sam. All rights reserved.
//

#import "SNRandomUtil.h"

@implementation SNRandomUtil

+ (NSArray *)RandomNumberArrayWithStartNumber:(NSInteger)startNumber AndCount:(NSInteger)count {
	if (count <= 0 || startNumber < 0) {
		return nil;
	}
	NSMutableArray *array = [NSMutableArray array];
	NSMutableArray *newarray = [NSMutableArray array];
	for (NSInteger i = startNumber; i < startNumber + count; i++) {
		[array addObject:@(i)];
	}
	for (NSInteger i = 0; i < startNumber + count; i++) {
        if ([array count]==0) {
            break;
        }
		int randomNumber = arc4random() % [array count];
		[newarray addObject:[array objectAtIndex:randomNumber]];
		[array removeObjectAtIndex:randomNumber];
	}
	return newarray;
}

+ (NSArray *)RandomCharArrayWithCase:(CharCase)charcase AndCount:(NSInteger)count {
	if (count <= 0) {
		return nil;
	}
	NSArray *lower = @[@"a", @"b", @"c", @"d", @"e", @"f", @"g", @"h", @"i", @"j", @"k", @"l", @"m", @"n", @"o", @"p", @"q", @"r", @"s", @"t", @"u", @"v", @"w", @"x", @"y", @"z"];
	NSArray *upper = @[@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z"];

	NSMutableArray *array = [NSMutableArray arrayWithCapacity:count];
	for (int i = 0; i < count; i++) {
		int randomNumber = arc4random() % [lower count];
		if (charcase == UPPERCASE) {
			[array addObject:[upper objectAtIndex:randomNumber]];
		}
		else {
			[array addObject:[lower objectAtIndex:randomNumber]];
		}
	}
	return array;
}

@end
