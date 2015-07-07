//
//  SNAleartUtil.h
//  SNCommon
//
//  Created by sam on 15/6/23.
//  Copyright (c) 2015年 sam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SNAleartUtil : UIView
/**
 *  @author sam, 15-06-23 15:06:46
 *
 *  弹出一个aleart对话框
 *
 *  @param Strtitle    标题
 *  @param msg         信息
 *  @param cancelTitle 退出按钮的标题
 *  @param Other       其他按钮的标题
 *  @param delegate    代理
 */
+ (void)ShowAleartWithTitle:(NSString *)Strtitle AndMessage:(NSString *)msg AndCancelBtnTitle:(NSString *)cancelTitle AndOtherTitle:(NSString *)Other AndDelegate:(id <UIAlertViewDelegate> )delegate;
/**
 *  @author sam, 15-06-23 16:06:01
 *
 *  显示一个普通的aleart
 *
 *  @param Strtitle 标题
 *  @param msg      信息
 *  @param delegate 代理
 */
+ (void)ShowTipsWithTitle:(NSString *)Strtitle AndMessage:(NSString *)msg AndDelegate:(id <UIAlertViewDelegate> )delegate;
/**
 *  @author sam, 15-06-23 16:06:38
 *
 *  显示信息
 *
 *  @param msg 信息内容
 */
+ (void)ShowTipsWithMessage:(NSString *)msg;
@end
