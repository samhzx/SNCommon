//
//  SNDataKeeper.h
//  SNCommon
//
//  Created by sam on 15/6/23.
//  Copyright (c) 2015年 sam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNDataKeeper : NSObject

+ (void)SaveInteger:(NSInteger)value forKey:(NSString *)key;
+ (NSInteger)ReadIntegerForKey:(NSString *)key;

+ (void)SaveDouble:(double)value forKey:(NSString *)key;
+ (double)ReadDoubleForKey:(NSString *)key;

+ (void)SaveString:(NSString *)value forKey:(NSString *)key;
+ (NSString *)ReadStringForKey:(NSString *)key;

+ (void)SaveBool:(BOOL)value forKey:(NSString *)key;
+ (BOOL)ReadBoolForKey:(NSString *)key;

+ (void)SaveData:(NSData *)value forKey:(NSString *)key;
+ (NSData *)ReadDataForKey:(NSString *)key;

+ (void)RemoveForKey:(NSString *)key;
@end
