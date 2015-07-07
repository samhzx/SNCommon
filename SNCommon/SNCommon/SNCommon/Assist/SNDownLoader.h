//
//  SNDownLoader.h
//  SNCommon
//
//  Created by sam on 15/6/29.
//  Copyright (c) 2015年 sam. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SNDownLoader;

/**
 *  下载进度的block
 *
 *  @param sndownloader 当前类
 *  @param progress     下载进度
 */
typedef void (^DownLoaderBlock)(SNDownLoader *sndownloader, double progress);

@protocol SNDownLoaderDelegate <NSObject>
@optional
/**
 *  下载代理
 *
 *  @param sndownloader 当前类
 *  @param progress     下载进度
 */
- (void)SNDownLoader:(SNDownLoader *)sndownloader Progress:(double)progress;
@end


@interface SNDownLoader : NSObject
/**
 *  现在的代理
 */
@property (nonatomic, assign)  id <SNDownLoaderDelegate> delegate;
/**
 *  下载进度block
 */
@property (nonatomic, copy)  DownLoaderBlock block;

/**
 *  文件的保存路径，在下载完成之后调用
 */
@property (nonatomic, copy) NSString *filePath;
/**
 *  标示符
 */
@property (nonatomic, copy)  NSString *identify;

/**
 *  下载的类方法
 *
 *  @param StrUrl 下载的链接地址
 *
 *  @return
 */
+ (instancetype)DownLoadWithURLString:(NSString *)StrUrl;
/**
 *  下载开始或者恢复
 */
- (void)startAndresume;
/**
 *  现在暂停
 */
- (void)pasue;
@end
