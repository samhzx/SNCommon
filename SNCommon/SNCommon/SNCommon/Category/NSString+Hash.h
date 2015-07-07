//
//  NSString+Hash.h
//  SNCommon
//
//  Created by sam on 15/6/29.
//  Copyright (c) 2015年 sam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Hash)
@property (readonly)  NSString *MD5String;
@property (readonly)  NSString *SHA1String;
@property (readonly)  NSString *SHA256String;
@property (readonly)  NSString *SHA512String;
@end
