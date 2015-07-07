//
//  NSString+Hash.m
//  SNCommon
//
//  Created by sam on 15/6/29.
//  Copyright (c) 2015年 sam. All rights reserved.
//

#import "NSString+Hash.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Hash)

@dynamic MD5String;
@dynamic SHA1String;
@dynamic SHA256String;
@dynamic SHA512String;

- (NSString *)MD5String {
	const char *original_str = [self UTF8String];
	unsigned char result[CC_MD5_DIGEST_LENGTH];
	CC_MD5(original_str, (int)strlen(original_str), result);
	NSMutableString *hash = [NSMutableString string];
	for (int i = 0; i < 16; i++)
		[hash appendFormat:@"%02x", result[i]];
	return hash;
}

- (NSString *)SHA1String {
	const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
	NSData *data = [NSData dataWithBytes:cstr length:self.length];
	uint8_t digest[CC_SHA1_DIGEST_LENGTH];
	CC_SHA1(data.bytes, (int)(data.length), digest);
	NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
	for (int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
		[output appendFormat:@"%02x", digest[i]];

	return output;
}

- (NSString *)SHA256String {
	const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
	NSData *data = [NSData dataWithBytes:cstr length:self.length];
	uint8_t digest[CC_SHA256_DIGEST_LENGTH];
	CC_SHA256(data.bytes, (int)data.length, digest);
	NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH * 2];
	for (int i = 0; i < CC_SHA256_DIGEST_LENGTH; i++)
		[output appendFormat:@"%02x", digest[i]];
	return output;
}

- (NSString *)SHA512String {
	const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
	NSData *data = [NSData dataWithBytes:cstr length:self.length];
	uint8_t digest[CC_SHA512_DIGEST_LENGTH];
	CC_SHA512(data.bytes, (int)data.length, digest);
	NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA512_DIGEST_LENGTH * 2];
	for (int i = 0; i < CC_SHA512_DIGEST_LENGTH; i++)
		[output appendFormat:@"%02x", digest[i]];
	return output;
}

@end
