#import "BWRZQTaskVideoPlayerViewController.h"
#import "SJVideoPlayer.h"
#import "Masonry.h"
#import "NSAttributedString+SJMake.h"
#import "CustomIOSAlertView.h"
#import "CustomInfoAlertView.h"
@interface BWRZQTaskVideoPlayerViewController ()<UINavigationControllerDelegate>{
    NSString *downloadLinkStr;
    BOOL     isRead;
    long     viewSeconds;
}
@property (weak, nonatomic) IBOutlet UIView *playerContainerView;
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UIButton *shengyinBtn;
@property (weak, nonatomic) IBOutlet UILabel *daojishiLabel;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIView *backBtnView;
@property (weak, nonatomic) IBOutlet UIView *infoView;
@property (weak, nonatomic) IBOutlet UIImageView *infoImageView;
@property (weak, nonatomic) IBOutlet UILabel *infoTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *infoDetailLabel;
@property (weak, nonatomic) IBOutlet UIButton *infoBtn;
@property (nonatomic, strong) SJVideoPlayer *player;
@end
@implementation BWRZQTaskVideoPlayerViewController
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    BOOL isShowHomePage = [viewController isKindOfClass:[self class]];
    [self.navigationController setNavigationBarHidden:isShowHomePage animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.backBtnView setFrame:CGRectMake(20, 30 + IS_iPhoneX_Top, 50, 30)];
    [self.topView setFrame:CGRectMake(SCREEN_WIDTH_DEVICE - 110 - 20, 30 + IS_iPhoneX_Top, 110, 30)];
    self.backBtnView.layer.masksToBounds = YES;
    self.backBtnView.layer.cornerRadius = 15.0f;
    self.backBtnView.layer.borderWidth = 1.0f;
    self.backBtnView.layer.borderColor = TextLightColor.CGColor;
    self.topView.layer.masksToBounds = YES;
    self.topView.layer.cornerRadius = 15.0f;
    self.topView.layer.borderWidth = 1.0f;
    self.topView.layer.borderColor = TextLightColor.CGColor;
    self.infoView.layer.masksToBounds = YES;
    self.infoView.layer.cornerRadius = 5.0f;
    self.infoBtn.layer.masksToBounds = YES;
    self.infoBtn.layer.cornerRadius = 3.0f;
    self.infoBtn.layer.borderWidth = 1.0f;
    self.infoBtn.layer.borderColor = ThemeColor.CGColor;
    self.fd_prefersNavigationBarHidden = YES;
    self.navigationController.delegate = self;
    self.infoView.hidden = YES;
    [[ServiceRequest sharedService] GET:[NSString stringWithFormat:@"video-task/%@", self.taskId] parameters:nil success:^(id responseObject) {
        [self showContent:responseObject];
    } failure:^(NSString *error, NSInteger code) {
        [self showHUDAlert:error];
    }];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}
- (void)dealloc
{
    [[ServiceRequest sharedService] cancelDataTaskForKey:[NSString stringWithFormat:@"video-task/%@", self.taskId]];
    self.navigationController.delegate = nil;
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [_player pause];
#ifdef DEBUG
        NSLog(@"AA: %d - %s", (int)__LINE__, __func__);
#endif
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if (self.navigationController.delegate == self){
        self.navigationController.delegate = nil;
    }
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}
- (void)showContent:(NSDictionary *)dic{
    isRead = [[dic objectForKey:@"viewed"] boolValue];
    viewSeconds = [[dic objectForKey:@"viewSeconds"] longValue];
    if (isRead) {
        CustomIOSAlertView *alertView = [[CustomIOSAlertView alloc] init];
        [alertView setContainerView:[[CustomInfoAlertView alloc] initItem:@"您已获取该视频观看奖励，是否继续观看？" withTitle:@"提示"]];
        [alertView setButtonTitles:[NSMutableArray arrayWithObjects:@"取消",@"观看", nil]];
        [alertView setOnButtonTouchUpInside:^(CustomIOSAlertView *alertView, int buttonIndex) {
            [alertView close];
            if (buttonIndex == 0) {
                [self goBackAction];
            }else{
                [self showContentPlayer:dic];
            }
        }];
        [alertView setUseMotionEffects:true];
        [self.view endEditing:YES];
        [alertView show];
    }else{
        [self showContentPlayer:dic];
    }
}
- (void)showContentPlayer:(NSDictionary *)dic{
    __weak BWRZQTaskVideoPlayerViewController *viewCon = self;
    _player = [SJVideoPlayer player];
    _player.defaultEdgeControlLayer.showResidentBackButton = NO;
    _player.defaultEdgeControlLayer.showResidentBackButtonHiden = YES;
    _player.defaultEdgeControlLayer.hiddenBottomProgressIndicator = YES;
    _player.lockedScreen = YES;
    _player.rotationManager.disabledAutorotation = NO;
    _player.fitOnScreen = NO;
    _player.gestureControl.supportedGestureTypes = SJPlayerGestureTypeMask_None;
    _player.playbackObserver.didPlayToEndTimeExeBlock = ^(__kindof SJBaseVideoPlayer * _Nonnull player) {
        if (player.isPlayedToEndTime) {
            NSLog(@"播放完毕");
            [viewCon requestHasRead];
        }
    };
    _player.playbackObserver.currentTimeDidChangeExeBlock = ^(__kindof SJBaseVideoPlayer * _Nonnull player) {
        long sec = (long)player.duration%60 - (long)player.currentTime%60;
        viewCon.daojishiLabel.text = [NSString stringWithFormat:@"%ld秒", (long)sec];
    };
    SJVideoPlayerURLAsset *asset = [[SJVideoPlayerURLAsset alloc] initWithURL:[NSURL URLWithString:[dic objectForKey:@"videoLink"]]];
    asset.title = @"";
    _player.URLAsset = asset;
    [_playerContainerView addSubview:_player.view];
    [_player.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    downloadLinkStr = [dic objectForKey:@"downloadLink"];
    if (downloadLinkStr.length > 0) {
        self.infoView.hidden = NO;
        [self.infoImageView sd_setImageWithURL:[NSURL URLWithString:[[dic objectForKey:@"taskThumbs"] firstObject]] placeholderImage:PlaceholderImage];
        self.infoTitleLabel.text = [dic objectForKey:@"taskTitle"];
        self.infoDetailLabel.text = [dic objectForKey:@"taskDescription"];
    }
}
- (void)requestHasRead{
    if (!isRead) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        [dic setObject:[NSNumber numberWithLong:viewSeconds] forKey:@"viewSeconds"];
        [[ServiceRequest sharedService] POST:[NSString stringWithFormat:@"video-task/view-records/%@", self.taskId] parameters:dic success:^(id responseObject) {
            [self showHUDAlert:@"已获得观看奖励"];
        } failure:^(NSString *error, NSInteger code) {
            [self showHUDAlert:error];
        }];
    }
}
- (IBAction)goBackAction:(id)sender {
    [self goBackAction];
}
- (IBAction)shengyinPress:(id)sender {
    self.shengyinBtn.selected = !self.shengyinBtn.selected;
    _player.muted = self.shengyinBtn.selected;
}
- (IBAction)infoBtnPress {
}
- (BOOL)prefersStatusBarHidden {
    return [self.player vc_prefersStatusBarHidden];
}
- (BOOL)prefersHomeIndicatorAutoHidden {
    return YES;
}
@end
