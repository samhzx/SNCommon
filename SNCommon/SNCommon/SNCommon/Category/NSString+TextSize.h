//
//  NSString+TextSize.h
//  SNCommon
//
//  Created by sam on 15/6/23.
//  Copyright (c) 2015年 sam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (TextSize)
/**
 *  @author sam, 15-06-23 10:06:33
 *
 *  计算文本的size
 *
 *  @param font 字体
 *  @param rect 文本所在的view的bounds
 *
 *  @return 计算的size
 */
- (CGSize)computeSizeWithFont:(UIFont *)font AndViewBounds:(CGRect)rect;
@end
