//
//  FlashLight.m
//  SNCommon
//
//  Created by sam on 15/6/22.
//  Copyright (c) 2015年 sam. All rights reserved.
//

#import "SNFlashLight.h"

@interface SNFlashLight ()
@property (nonatomic, strong) AVCaptureSession *captureSession;
@property (nonatomic, strong) AVCaptureDevice *captureDevice;
@end

@implementation SNFlashLight

+ (instancetype)sharedFlashLight {
	static id instace = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		instace = [[self alloc] init];
	});
	return instace;
}

- (instancetype)init {
	self = [super init];
	if (self) {
		if (_captureSession == nil) {
			_captureSession = [[AVCaptureSession alloc] init];
		}
		if (_captureDevice == nil) {
			_captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
		}
		NSError *err = nil;
		AVCaptureDeviceInput *deviceInput = [[AVCaptureDeviceInput alloc] initWithDevice:_captureDevice error:&err];
		NSAssert(!err, @"初始化失败,失败理由:%@", err.description);
		[_captureSession addInput:deviceInput];
	}
	return self;
}

+ (BOOL)trunOnFlashLight {
	if ([[[self sharedFlashLight] captureDevice] hasTorch] && [[[self sharedFlashLight] captureDevice] hasFlash]) {
		if ([[self sharedFlashLight] captureDevice].torchMode == AVCaptureTorchModeOff) {
			[[[self sharedFlashLight] captureSession] beginConfiguration];
			[[[self sharedFlashLight] captureDevice] lockForConfiguration:nil];
			[[[self sharedFlashLight] captureDevice] setTorchMode:AVCaptureTorchModeOn];
			[[[self sharedFlashLight] captureDevice] setFlashMode:AVCaptureFlashModeOn];
			[[[self sharedFlashLight] captureDevice] unlockForConfiguration];
			[[[self sharedFlashLight] captureSession] commitConfiguration];
		}
	}
	[[[self sharedFlashLight] captureSession]  startRunning];
	return true;
}

+ (BOOL)trunOffFlashLight {
	[[[self sharedFlashLight] captureSession] beginConfiguration];
	[[[self sharedFlashLight] captureDevice] lockForConfiguration:nil];
	if ([[self sharedFlashLight] captureDevice].torchMode == AVCaptureTorchModeOn) {
		[[[self sharedFlashLight] captureDevice] setTorchMode:AVCaptureTorchModeOff];
		[[[self sharedFlashLight] captureDevice] setFlashMode:AVCaptureFlashModeOff];
	}
	[[[self sharedFlashLight] captureDevice] unlockForConfiguration];
	[[[self sharedFlashLight] captureSession] commitConfiguration];
	[[[self sharedFlashLight] captureSession] stopRunning];
	return true;
}

+ (AVCaptureTorchMode)checkStatusFlashLight {
	return [[self sharedFlashLight] captureDevice].torchMode;
}

@end
