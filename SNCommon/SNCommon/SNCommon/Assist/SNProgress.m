//
//  SNProgress.m
//  SNProgress
//
//  Created by sam on 15/5/29.
//  Copyright (c) 2015年 sam. All rights reserved.
//

#import "SNProgress.h"

@interface SNProgress ()

@property (nonatomic, strong) UILabel *titleLable;
@property (nonatomic, strong) UIViewController *superVC;
@end

@implementation SNProgress

//创建该类的单例
+ (instancetype)sharedProgress {
	static id instace = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		instace = [[self alloc] initWithFrame:[UIScreen mainScreen].bounds];
	});
	return instace;
}

- (instancetype)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		self.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.330];

		UIView *contentView = [[UIView alloc] init];
		contentView.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.750];
		contentView.layer.masksToBounds = YES;
		contentView.layer.cornerRadius = 5;
		contentView.translatesAutoresizingMaskIntoConstraints = NO;

		UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
		indicator.hidesWhenStopped = YES;
		indicator.translatesAutoresizingMaskIntoConstraints = NO;

		_titleLable = [[UILabel alloc] init];
		_titleLable.textColor = [UIColor whiteColor];
		_titleLable.font = [UIFont systemFontOfSize:14];
		_titleLable.textAlignment = NSTextAlignmentCenter;
		self.titleLable.translatesAutoresizingMaskIntoConstraints = NO;

		[self addSubview:contentView];
		[contentView addSubview:indicator];
		[contentView addSubview:_titleLable];

		[self addConstraint:[NSLayoutConstraint constraintWithItem:contentView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
		[self addConstraint:[NSLayoutConstraint constraintWithItem:contentView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
		[self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[contentView(==80)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(contentView)]];
		[self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[contentView(==80)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(contentView)]];


		[contentView addConstraint:[NSLayoutConstraint constraintWithItem:indicator attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:contentView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
		[contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[indicator(==20)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(indicator)]];


		[contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_titleLable]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_titleLable)]];
		[contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_titleLable(==20)]-5-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_titleLable)]];

		[indicator startAnimating];
	}
	return self;
}

- (void)initWithStatus:(NSString *)title {
	self.titleLable.text = title;
	[[UIApplication sharedApplication].keyWindow addSubview:self];
}

+ (void)showProgress:(NSString *)status {
	[[self sharedProgress] initWithStatus:status];
}

+ (void)closeProgress {
	[[self sharedProgress] closeProgress];
}

- (void)closeProgress {
	[self removeFromSuperview];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	[super touchesBegan:touches withEvent:event];
	[self closeProgress];
}

@end
