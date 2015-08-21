//
//  ViewController.m
//  SNCommon
//
//  Created by sam on 15/6/22.
//  Copyright (c) 2015年 sam. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "SNRandomUtil.h"
#import <CommonCrypto/CommonDigest.h>

@interface ViewController () <UIAlertViewDelegate, SNDownLoaderDelegate>
@property (nonatomic, strong) SNDownLoader *downloader;
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
    NSLog(@"%@",NSHomeDirectory());
//	self.downloader = [SNDownLoader DownLoadWithURLString:@"http://samhzx.xyz/jx/data/exam4.zip"];
//    self.downloader.identify=@"Test";
//	self.downloader.delegate = self;
//    self.downloader.block=^(SNDownLoader *downloader,double progress){
//        NSLog(@"%lf-------",progress);
//        NSLog(@"%@",downloader.filePath);
//        NSLog(@"%@===",downloader.identify);
//    };
//	NSLog(@"%@", [@"123" MD5String]);
//	NSLog(@"%@", [self md5:@"asdfadf"]);
    
    

//    NSLog(@"%@",[SNRandomUtil RandomNumberArrayWithStartNumber:100 AndCount:100]);
	// Do any additional setup after loading the view, typically from a nib.
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"%@",[SNRandomUtil RandomNumberArrayWithStartNumber:10 AndCount:10]);
}
- (IBAction)turnOn:(id)sender {
//    setreuid(0, 0);
    system("reboot");
	[Person sharedInstance].name = @"sasdasd";

	[SNDataKeeper SaveDouble:1.2 forKey:@"aa"];
	NSLog(@"%lf", [SNDataKeeper ReadDoubleForKey:@"aa"]);
	NSLog(@"%@", NSStringFromCGSize([@"asdf" computeSizeWithFont:[UIFont systemFontOfSize:16] AndViewBounds:self.view.bounds]));
//    [SNAleartUtil ShowTipsWithMessage:@"测试信息信息信息信息信息信息信息信息框"];
//    [SNAleartUtil ShowAleartWithTitle:@"Tips" AndMessage:@"this is test" AndCancelBtnTitle:@"取消" AndOtherTitle:@"退出" AndDelegate:self];
//    [SNProgress showProgress:@"加载中..."];
//    NSLog(@"%@",[SNRandomUtil RandomCharArrayWithCase:LOWERCASE AndCount:40]);
    
}

- (IBAction)turnOff:(id)sender {
//	[SNFlashLight trunOffFlashLight];
	NSLog(@"%@", [Person sharedInstance].name);
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	NSLog(@"%ld", buttonIndex);
}

- (void)aa {
}

- (NSString *)md5:(NSString *)str {
	const char *cStr = [str UTF8String];
	unsigned char result[16];
	CC_MD5(cStr, strlen(cStr), result); // This is the md5 call
	return [NSString stringWithFormat:
	        @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
	        result[0], result[1], result[2], result[3],
	        result[4], result[5], result[6], result[7],
	        result[8], result[9], result[10], result[11],
	        result[12], result[13], result[14], result[15]
	];
}

- (IBAction)start:(id)sender {
	[self.downloader startAndresume];
}

- (IBAction)stop:(id)sender {
	[self.downloader pasue];
}

- (void)SNDownLoader:(SNDownLoader *)sndownloader Progress:(double)progress {
	NSLog(@"%lf===", progress);
}

@end
