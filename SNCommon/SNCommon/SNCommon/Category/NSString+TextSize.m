//
//  NSString+TextSize.m
//  SNCommon
//
//  Created by sam on 15/6/23.
//  Copyright (c) 2015年 sam. All rights reserved.
//

#import "NSString+TextSize.h"

@implementation NSString (TextSize)
- (CGSize)computeSizeWithFont:(UIFont *)font AndViewBounds:(CGRect)rect {
	return [self boundingRectWithSize:CGSizeMake(rect.size.width, HUGE_VAL) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName:font } context:nil].size;
}

@end
