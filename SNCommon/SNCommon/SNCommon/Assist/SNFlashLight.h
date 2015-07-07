//
//  FlashLight.h
//  SNCommon
//
//  Created by sam on 15/6/22.
//  Copyright (c) 2015年 sam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface SNFlashLight : NSObject
/**
 *  @author sam, 15-06-22 12:06:00
 *
 *  打开闪光灯
 *
 *  @return
 */
+ (BOOL)trunOnFlashLight;
/**
 *  @author sam, 15-06-22 12:06:16
 *
 *  关闭闪光灯
 *
 *  @return
 */
+ (BOOL)trunOffFlashLight;
/**
 *  @author sam, 15-06-22 12:06:26
 *
 *  检查闪光灯的状态
 *
 *  @return
 */
+ (AVCaptureTorchMode)checkStatusFlashLight;


@end
