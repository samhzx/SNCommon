//
//  SNDataKeeper.m
//  SNCommon
//
//  Created by sam on 15/6/23.
//  Copyright (c) 2015年 sam. All rights reserved.
//

#import "SNDataKeeper.h"

@implementation SNDataKeeper
+ (void)SaveInteger:(NSInteger)value forKey:(NSString *)key {
	if ([key isKindOfClass:[NSNull class]]) {
		return;
	}
	[[NSUserDefaults standardUserDefaults] setInteger:value forKey:key];
}

+ (NSInteger)ReadIntegerForKey:(NSString *)key {
	if ([key isKindOfClass:[NSNull class]]) {
		return 0;
	}
	return [[[NSUserDefaults standardUserDefaults] objectForKey:key] integerValue];
}

+ (void)SaveDouble:(double)value forKey:(NSString *)key {
	if ([key isKindOfClass:[NSNull class]]) {
		return;
	}
	[[NSUserDefaults standardUserDefaults] setDouble:value forKey:key];
}

+ (double)ReadDoubleForKey:(NSString *)key {
	if ([key isKindOfClass:[NSNull class]]) {
		return 0;
	}
	return [[[NSUserDefaults standardUserDefaults] objectForKey:key] doubleValue];
}

+ (void)SaveBool:(BOOL)value forKey:(NSString *)key {
	if ([key isKindOfClass:[NSNull class]]) {
		return;
	}
	[[NSUserDefaults standardUserDefaults] setBool:value forKey:key];
}

+ (BOOL)ReadBoolForKey:(NSString *)key {
	if ([key isKindOfClass:[NSNull class]]) {
		return 0;
	}
	return [[[NSUserDefaults standardUserDefaults] objectForKey:key] boolValue];
}

+ (void)SaveString:(NSString *)value forKey:(NSString *)key {
	if ([key isKindOfClass:[NSNull class]]) {
		return;
	}
	[[NSUserDefaults standardUserDefaults] setObject:value forKey:key];
}

+ (NSString *)ReadStringForKey:(NSString *)key {
	if ([key isKindOfClass:[NSNull class]]) {
		return 0;
	}
	return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

+ (void)SaveData:(NSData *)value forKey:(NSString *)key {
	if ([key isKindOfClass:[NSNull class]]) {
		return;
	}
	[[NSUserDefaults standardUserDefaults] setObject:value forKey:key];
}

+ (NSData *)ReadDataForKey:(NSString *)key {
	if ([key isKindOfClass:[NSNull class]]) {
		return 0;
	}
	return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

+ (void)RemoveForKey:(NSString *)key {
	[[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
}

@end
