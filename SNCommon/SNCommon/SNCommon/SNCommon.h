//
//  SNCommon1.h
//  SNCommon
//
//  Created by sam on 15/6/23.
//  Copyright (c) 2015年 sam. All rights reserved.
//


#define APPDEBUG

#ifdef APPDEBUG
	#define NSLog(...) NSLog(__VA_ARGS__)
	#define debugMethod() NSLog(@"%s", __func__)
#else
	#define NSLog(...)
	#define debugMethod()
#endif


// .h文件
#define SingletonH +(instancetype)sharedInstance;

// .m文件
#define SingletonM \
static id _instance; \
\
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
} \
\
+ (instancetype)sharedInstance \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [[self alloc] init]; \
}); \
return _instance; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return _instance; \
}

#import "SNFlashLight.h"
#import "SNProgress.h"
#import "SNRandomUtil.h"
#import "SNAleartUtil.h"
#import "SNDataKeeper.h"
#import "SNDownLoader.h"

#import "NSString+TextSize.h"
#import "NSDate+Conver.h"
#import "NSString+Hash.h"




@interface SNCommon : NSObject
SingletonH
@end
