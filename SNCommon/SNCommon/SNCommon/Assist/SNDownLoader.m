//
//  SNDownLoader.m
//  SNCommon
//
//  Created by sam on 15/6/29.
//  Copyright (c) 2015年 sam. All rights reserved.
//

#import "SNDownLoader.h"

@interface SNDownLoader () <NSURLSessionDownloadDelegate>
/**
 *  保存下载地址
 */
@property (nonatomic, copy)  NSString *StrUrl;
@property (nonatomic, strong) NSURLSession *session;
/**
 *  下载任务
 */
@property (nonatomic, strong) NSURLSessionDownloadTask *downTask;
/**
 *  恢复下载时候需要的resumeData;
 */
@property (nonatomic, strong) NSData *resumeData;
@end

@implementation SNDownLoader
+ (instancetype)DownLoadWithURLString:(NSString *)StrUrl {
	SNDownLoader *downloader = [[SNDownLoader alloc] initWithURLString:StrUrl];
	return downloader;
}

/**
 *  自定义初始化
 *
 *  @param StrUrl 下载链接地址
 *
 *  @return
 */
- (instancetype)initWithURLString:(NSString *)StrUrl {
	self = [super init];
	if (self) {
		NSURLSessionConfiguration *cfg = [NSURLSessionConfiguration defaultSessionConfiguration];
		self.session = [NSURLSession sessionWithConfiguration:cfg delegate:self delegateQueue:[NSOperationQueue mainQueue]];
		self.StrUrl = StrUrl;
	}
	return self;
}

- (void)startAndresume {
	//如果下载地址为空就返回
	if (!self.StrUrl) return;

	//这里判断是开始  暂停  恢复
	if (self.downTask == nil) {
		if (self.resumeData) {
			[self resume];
		}
		else {
			[self start];
		}
	}
	else {
		[self pasue];
	}
}

/**
 *  开始下载任务
 */
- (void)start {
	//创建URL
	NSURL *url = [NSURL URLWithString:self.StrUrl];
	//创建下载任务
	self.downTask = [self.session downloadTaskWithURL:url];
	//开始下载
	[self.downTask resume];
}

/**
 *  恢复下载任务
 */
- (void)resume {
	self.downTask = [self.session downloadTaskWithResumeData:self.resumeData];
	[self.downTask resume];
	self.resumeData = nil;
}

/**
 *  暂停下载任务
 */
- (void)pasue {
	__weak typeof(self) WeakSelf = self;
	[self.downTask cancelByProducingResumeData: ^(NSData *resumeData) {
	    WeakSelf.resumeData = resumeData;
	    WeakSelf.downTask = nil;
	}];
}

/**
 *  下载完成之后调用
 *
 *  @param session
 *  @param downloadTask 这里面能够得到请求的一些信息
 *  @param location     存有下载完成之后的保存路径
 */
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location {
    //缓存文件夹
	NSString *caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    //文件保存地址
    //downloadTask.response.suggestedFilename  文件名和请求的文件名一样
	NSString *file = [caches stringByAppendingPathComponent:downloadTask.response.suggestedFilename];

	NSFileManager *fm = [NSFileManager defaultManager];
	[fm moveItemAtPath:location.path toPath:file error:nil];

	self.resumeData = nil;
	self.downTask = nil;
    //保存路径赋值
	self.filePath = file;
    
	if (self.delegate && [self.delegate respondsToSelector:@selector(SNDownLoader:Progress:)]) {
		[self.delegate SNDownLoader:self Progress:1];
	}
	if (self.block) {
		self.block(self, 1);
	}
}

/**
 *  下载进度
 *
 *  @param session
 *  @param downloadTask              下载任务
 *  @param bytesWritten
 *  @param totalBytesWritten         总共下了多长
 *  @param totalBytesExpectedToWrite 总共长度
 */
- (void)           URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
                 didWriteData:(int64_t)bytesWritten
            totalBytesWritten:(int64_t)totalBytesWritten
    totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {
	if (self.delegate && [self.delegate respondsToSelector:@selector(SNDownLoader:Progress:)]) {
		[self.delegate SNDownLoader:self Progress:(double)totalBytesWritten / totalBytesExpectedToWrite];
	}
	if (self.block) {
		self.block(self, (double)totalBytesWritten / totalBytesExpectedToWrite);
	}
}

@end
