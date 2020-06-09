#import "BWRZQBaiduRewardVideoViewController.h"
#import <BaiduMobAdSDK/BaiduMobAdRewardVideo.h>
@interface BWRZQBaiduRewardVideoViewController ()<UINavigationControllerDelegate, BaiduMobAdRewardVideoDelegate>
@property (nonatomic, strong) BaiduMobAdRewardVideo *reward;
@end
@implementation BWRZQBaiduRewardVideoViewController
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    BOOL isShowHomePage = [viewController isKindOfClass:[self class]];
    [self.navigationController setNavigationBarHidden:isShowHomePage animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.fd_prefersNavigationBarHidden = YES;
    self.navigationController.delegate = self;
    self.reward = [[BaiduMobAdRewardVideo alloc] init];
    self.reward.delegate = self;
    self.reward.AdUnitTag = @"7070962";
    self.reward.publisherId = BaiduAPPSID;
    [self.reward show];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if (self.navigationController.delegate == self){
        self.navigationController.delegate = nil;
    }
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}
- (IBAction)customBackActionPress {
    [self goBackAction];
}
- (IBAction)refreshPress {
    [self preload];
}
- (IBAction)showVideoPress {
    [self showClick];
}
- (void)dealloc
{
    self.navigationController.delegate = nil;
}
- (BOOL)prefersHomeIndicatorAutoHidden {
    return YES;
}
- (void)preload {
    [self.reward load];
}
- (void)isExpire {
    BOOL ready = [self.reward isReady];
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"完整观看视频才可获得奖励"
                              message:nil
                              delegate:self
                              cancelButtonTitle:@"确定"
                              otherButtonTitles:nil];
    if (ready) {
        alertView.title = @"视频广告可用";
        NSLog(@"视频广告可用");
    }else{
        alertView.title = @"视频广告不可用";
        NSLog(@"视频广告不可用");
    }
    [alertView show];
}
- (void)showClick {
    [self.reward showFromViewController:self];
    if (self.reward.isReady) {
        NSLog(@"广告已过期");
    }
}
- (void)confirmAction {
    [self preload];
}
- (void)rewardedVideoAdLoaded:(BaiduMobAdRewardVideo *)video {
    [[[UIAlertView alloc]initWithTitle:@"激励视频缓存成功" message:nil delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil] show];
    NSLog(@"激励视频缓存成功");
}
- (void)rewardedVideoAdLoadFailed:(BaiduMobAdRewardVideo *)video withError:(BaiduMobFailReason)reason {
    [[[UIAlertView alloc]initWithTitle:@"激励视频缓存失败" message:nil delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil] show];
    NSLog(@"激励视频缓存失败，failReason：%d",reason);
}
- (void)rewardedVideoAdShowFailed:(BaiduMobAdRewardVideo *)video withError:(BaiduMobFailReason)reason {
    NSLog(@"激励视频展现失败，failReason：%d",reason);
    [[[UIAlertView alloc]initWithTitle:@"激励视频展现失败" message:nil delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil] show];
}
- (void)rewardedVideoAdDidStarted:(BaiduMobAdRewardVideo *)video {
    NSLog(@"激励视频开始播放");
}
- (void)rewardedVideoAdDidPlayFinish:(BaiduMobAdRewardVideo *)video {
    NSLog(@"激励视频完成播放");
}
- (void)rewardedVideoAdDidClick:(BaiduMobAdRewardVideo *)video withPlayingProgress:(CGFloat)progress {
    NSLog(@"激励视频LP被点击，progress:%f",progress);
}
- (void)rewardedVideoAdDidClose:(BaiduMobAdRewardVideo *)video withPlayingProgress:(CGFloat)progress {
    NSLog(@"激励视频点击关闭,progress:%f",progress);
}
@end
