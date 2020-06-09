//
//  MIPhotoBrowser.m
//  PhotoBrowser
//
//  Created by zc on 16/8/11.
//  Copyright © 2016年 zcDong. All rights reserved.
//

#import "MIPhotoBrowser.h"
#import "MIBrowserImageView.h"
#import "UIActionSheet+Blocks.h"
#import "MBProgressHUD.h"

#define kPhotoBrowserImageViewMargin 10
#define animationTime 0.3

@interface MIPhotoBrowser ()
@property(nonatomic, strong) UIScrollView *scrollView;
@property(nonatomic, assign) BOOL hasShowedFirstView;
@property(nonatomic, strong) UILabel *indexLabel;
@end
@implementation MIPhotoBrowser
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    }
    return self;
}

- (void)didMoveToSuperview{
    [self setupScrollView];
}

- (void)setupScrollView{
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.delegate = self;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES;
    [self addSubview:self.scrollView];
    
    for (NSInteger i = 0; i < self.imageCount; i++) {
        MIBrowserImageView *imageView = [[MIBrowserImageView alloc] init];
        imageView.tag = i;
        imageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(photoClick:)];
        
        UILongPressGestureRecognizer *longTap = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(imglongTapClick:)];
        
        UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTapAction:)];
        doubleTap.numberOfTapsRequired = 2;
        [tap requireGestureRecognizerToFail:doubleTap];
        
        [imageView addGestureRecognizer:tap];
        [imageView addGestureRecognizer:longTap];
        [imageView addGestureRecognizer:doubleTap];
        [self.scrollView addSubview:imageView];
    }
    [self setupImageOfImageViewForIndex:self.currentImageIndex];
}

- (void)setupImageOfImageViewForIndex:(NSInteger)index{
    MIBrowserImageView *imageView = self.scrollView.subviews[index];
    self.currentImageIndex = index;
//    if (imageView.hasLoadedImage) return;
//    if ([self highQualityImageURLForIndex:index]) {
//        [imageView setImageWithURL:[self highQualityImageURLForIndex:index] placeholderImage:[self placeholderImageForIndex:index]];
//    } else {
        imageView.image = [self placeholderImageForIndex:index];
//    }
//    imageView.hasLoadedImage = YES;
}

- (void)photoClick:(UIGestureRecognizer *)gesture{
    
    self.scrollView.hidden = YES;
    MIBrowserImageView *currentImageView = (MIBrowserImageView *)gesture.view;
    NSInteger currentIndex = currentImageView.tag;
    
    CGRect targetTemp = [self.sourceImagesContainerView convertRect:self.currentImgaeView.frame toView:self];
    
    UIImageView *tempView = [[UIImageView alloc] init];
    tempView.contentMode = self.currentImgaeView.contentMode;
    tempView.clipsToBounds = YES;
    tempView.image = currentImageView.image;
    CGFloat h = (self.bounds.size.width / currentImageView.image.size.width) * currentImageView.image.size.height;
    
    if (!currentImageView.image) { // 防止 因imageview的image加载失败 导致 崩溃
        h = self.bounds.size.height;
    }
    
    tempView.bounds = CGRectMake(0, 0, self.bounds.size.width, h);
    tempView.center = self.center;
    
    [self addSubview:tempView];
    
    [UIView animateWithDuration:animationTime animations:^{
        tempView.frame = targetTemp;
        self.backgroundColor = [UIColor clearColor];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

 -(void)imglongTapClick:(UILongPressGestureRecognizer*)gesture{
     if(gesture.state==UIGestureRecognizerStateBegan){
         MIBrowserImageView *currentImageView = (MIBrowserImageView *)gesture.view;
         //1.获取选择的图片
         UIImage *image = currentImageView.image;
         //2.初始化一个监测器
         CIDetector*detector = [CIDetector detectorOfType:CIDetectorTypeQRCode context:nil options:@{ CIDetectorAccuracy : CIDetectorAccuracyHigh }];
         //监测到的结果数组
         NSArray *features = [detector featuresInImage:[CIImage imageWithCGImage:image.CGImage]];
         if (features.count >=1) {
             /**结果对象 */
             CIQRCodeFeature *feature = [features objectAtIndex:0];
             NSString *scannedResult = feature.messageString;
             [UIActionSheet showInView:self withTitle:nil cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@[@"保存图片到手机",@"识别二维码"] tapBlock:^(UIActionSheet * _Nonnull actionSheet, NSInteger buttonIndex) {
                 if (buttonIndex==0) {
                     MIBrowserImageView *currentImageView = (MIBrowserImageView *)gesture.view;
                     UIImageWriteToSavedPhotosAlbum(currentImageView.image, self, @selector(image:didFinishSavingWithError:contextInfo:), (__bridge void *)self);
                 }else if (buttonIndex == 1){
                      [[UIApplication sharedApplication] openURL:[NSURL URLWithString:scannedResult]];
                 }
             }];
         }
         else{
             [UIActionSheet showInView:self withTitle:nil cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@[@"保存图片到手机"] tapBlock:^(UIActionSheet * _Nonnull actionSheet, NSInteger buttonIndex) {
                 if (buttonIndex==0) {
                     MIBrowserImageView *currentImageView = (MIBrowserImageView *)gesture.view;
                     UIImageWriteToSavedPhotosAlbum(currentImageView.image, self, @selector(image:didFinishSavingWithError:contextInfo:), (__bridge void *)self);
                 }
             }];
         }
         
         
     }
}


- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (!error) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.label.text = @"已保存到系统相册";
        hud.margin = 20.f;
        hud.removeFromSuperViewOnHide = YES;
        hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
        hud.bezelView.color = [UIColor colorWithWhite:0.f alpha:0.7f];
        [hud hideAnimated:YES afterDelay:2.0f];
    }else{
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.label.text = @"保存失败";
        hud.margin = 20.f;
        hud.removeFromSuperViewOnHide = YES;
        hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
        hud.bezelView.color = [UIColor colorWithWhite:0.f alpha:0.7f];
        [hud hideAnimated:YES afterDelay:2.0f];
    }
}

- (void)handleDoubleTapAction:(UIGestureRecognizer *)gesture{
    MIBrowserImageView *imageView = (MIBrowserImageView *)gesture.view;
    CGFloat scale;
    if (imageView.isScaled) {
        scale = 1.0;
    } else {
        scale = 2.0;
    }
    
    MIBrowserImageView *view = (MIBrowserImageView *)gesture.view;
    
    [view doubleTapToZoomWithScale:scale ];
}

- (void)showFirstImage{
    CGRect rect = [self.sourceImagesContainerView convertRect:self.currentImgaeView.frame toView:self];

    UIImageView *tmpImageView = [[UIImageView alloc] init];
    tmpImageView.frame = rect;
    tmpImageView.image = [self placeholderImageForIndex:self.currentImageIndex];
    tmpImageView.contentMode = self.scrollView.subviews[self.currentImageIndex].contentMode;
    [self addSubview:tmpImageView];
    
    CGRect targetTemp = [self.scrollView.subviews[self.currentImageIndex] bounds];
    self.scrollView.hidden = YES;
    
    [UIView animateWithDuration:animationTime animations:^{
        tmpImageView.center = self.center;
        tmpImageView.bounds = CGRectMake(0, 0, targetTemp.size.width,targetTemp.size.height);
    } completion:^(BOOL finished) {
        self->_hasShowedFirstView = YES;
        [tmpImageView removeFromSuperview];
        self.scrollView.hidden = NO;
    }];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGRect rect = self.bounds;
    rect.size.width += kPhotoBrowserImageViewMargin * 2;
    
    self.scrollView.bounds = rect;
    self.scrollView.center = self.center;
    
    CGFloat y = 0;
    CGFloat w = self.scrollView.frame.size.width - kPhotoBrowserImageViewMargin * 2;
    CGFloat h = self.scrollView.frame.size.height;
    
    
    [self.scrollView.subviews enumerateObjectsUsingBlock:^(MIBrowserImageView *obj, NSUInteger idx, BOOL *stop) {
        CGFloat x = kPhotoBrowserImageViewMargin + idx * (kPhotoBrowserImageViewMargin * 2 + w);
        obj.frame = CGRectMake(x, y, w, h);
    }];
    
    self.scrollView.contentSize = CGSizeMake(self.scrollView.subviews.count * self.scrollView.frame.size.width, 0);
    self.scrollView.contentOffset = CGPointMake(self.currentImageIndex * self.scrollView.frame.size.width, 0);
    
    
    if (!_hasShowedFirstView) {
        [self showFirstImage];
    }
}

- (void)show{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    self.frame = window.bounds;
    [window addSubview:self];
}

- (UIImage *)placeholderImageForIndex:(NSInteger)index{
    if ([self.delegate respondsToSelector:@selector(photoBrowser:placeholderImageForIndex:)]) {
       return  [self.delegate photoBrowser:self placeholderImageForIndex:self.currentImageIndex];
    }
    return nil;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int index = (scrollView.contentOffset.x + self.scrollView.bounds.size.width * 0.5) / self.scrollView.bounds.size.width;
    
    // 有过缩放的图片在拖动一定距离后清除缩放
    CGFloat margin = 150;
    CGFloat x = scrollView.contentOffset.x;
    if ((x - index * self.bounds.size.width) > margin || (x - index * self.bounds.size.width) < - margin) {
        MIBrowserImageView *imageView = self.scrollView.subviews[index];
//        if (imageView.isScaled) {
            [UIView animateWithDuration:0.5 animations:^{
                imageView.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {
//                [imageView eliminateScale];
            }];
//        }
    }
    
    
//    if (!_willDisappear) {
//        _indexLabel.text = [NSString stringWithFormat:@"%d/%ld", index + 1, (long)self.imageCount];
//    }
    [self setupImageOfImageViewForIndex:index];
}
@end
