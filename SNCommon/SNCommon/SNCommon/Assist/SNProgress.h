//
//  SNProgress.h
//  SNProgress
//
//  Created by sam on 15/5/29.
//  Copyright (c) 2015年 sam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SNProgress : UIView
/**
 *  @author sam, 15-06-23 16:06:49
 *
 *  显示活动指示器
 *
 *  @param status 显示的文字
 */
+ (void)showProgress:(NSString *)status;
/**
 *  @author sam, 15-06-23 17:06:27
 *
 *  关闭活动指示器
 */
+ (void)closeProgress;
@end
