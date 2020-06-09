//
//  WZYPreviewImage.m
//  demo
//
//  Created by WangZhenyu on 16/3/29.
//  Copyright © 2016年 WangZhenyu. All rights reserved.
//

#import "WZYPreviewImage.h"
#import "AppDelegate.h"

@interface WZYPreviewImage ()

@property (nonatomic, assign) CGRect rect;
@property (nonatomic, strong) UIToolbar *mbl;
@property (nonatomic, strong) UIImageView *previewImageView;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation WZYPreviewImage

+ (instancetype)showPreviewWithImageView:(UIImageView *)imageView {
    WZYPreviewImage *view = [[self alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [view previewImageWithView:imageView];
    AppDelegate *del = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [del.navigationController.view addSubview:view];
//    [[UIApplication sharedApplication].keyWindow addSubview:view];
    return view;
}

- (void)previewImageWithView:(UIImageView *)imageView {
    imageView.hidden = YES;
    self.imageView = imageView;
    
    UIToolbar *mbl = ({
        UIToolbar *mbl = [[UIToolbar alloc] initWithFrame:self.frame];
        mbl.barStyle = UIBarStyleBlackOpaque;
        mbl.alpha = 0;
        [self addSubview:mbl];
        self.mbl = mbl;
        mbl;
    });
    
    UIImageView *previewImageView = ({
        UIImageView *previewImageView = [[UIImageView alloc] init];
        previewImageView.contentMode = UIViewContentModeScaleAspectFill;
        self.rect = [imageView convertRect:imageView.bounds toView:[[[UIApplication sharedApplication] delegate] window]];
        previewImageView.frame = self.rect;
        previewImageView.image = imageView.image;
        [self addSubview:previewImageView];
        self.previewImageView = previewImageView;
        previewImageView;
    });
    
    [UIView animateWithDuration:0.35 animations:^{
        CGRect rect = previewImageView.frame;
        CGFloat offset = self.bounds.size.width / rect.size.width;
        rect.size.width = self.bounds.size.width;
        rect.size.height = rect.size.height * offset;
        previewImageView.frame = rect;
        previewImageView.center = self.center;
        mbl.alpha = 0.98;
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [UIView animateWithDuration:0.25 animations:^{
        self.mbl.alpha = 0;
        self.previewImageView.frame = self.rect;
    } completion:^(BOOL finished) {
        self.imageView.hidden = NO;
        [self removeFromSuperview];
    }];
}

@end
