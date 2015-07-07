//
//  SNAleartUtil.m
//  SNCommon
//
//  Created by sam on 15/6/23.
//  Copyright (c) 2015年 sam. All rights reserved.
//

#import "SNAleartUtil.h"

@interface SNAleartUtil ()
@end

@implementation SNAleartUtil
+ (void)ShowAleartWithTitle:(NSString *)Strtitle AndMessage:(NSString *)msg AndCancelBtnTitle:(NSString *)cancelTitle AndOtherTitle:(NSString *)Other AndDelegate:(id<UIAlertViewDelegate>)delegate {
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:Strtitle message:msg delegate:delegate cancelButtonTitle:cancelTitle otherButtonTitles:Other, nil];
	[alert show];
}
+ (void)ShowTipsWithTitle:(NSString *)Strtitle AndMessage:(NSString *)msg AndDelegate:(id<UIAlertViewDelegate>)delegate{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:Strtitle message:msg delegate:delegate cancelButtonTitle:@"确定" otherButtonTitles:nil];
	[alert show];
}

+ (void)ShowTipsWithMessage:(NSString *)msg {
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
	[alert show];
	[NSThread detachNewThreadSelector:@selector(closeTips:) toTarget:self withObject:alert];
}

+ (void)closeTips:(id)obj {
	[NSThread sleepForTimeInterval:2];
	[obj dismissWithClickedButtonIndex:0 animated:YES];
}
@end
