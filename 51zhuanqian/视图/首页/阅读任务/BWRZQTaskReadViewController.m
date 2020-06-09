#import "BWRZQTaskReadViewController.h"
#import "ZZCircleProgress.h"
#import <WebKit/WebKit.h>
#import "GlobalFunction.h"
#import "MBProgressHUD.h"
#import "ShareView.h"
@interface BWRZQTaskReadViewController ()<UIScrollViewDelegate,UINavigationControllerDelegate,WKUIDelegate, WKNavigationDelegate, WKScriptMessageHandler>{
    NSInteger       count;
    float           readTimeNum;
    NSInteger       currentReadTimeNum;
    NSDictionary    *contentDic;
}
@property (strong, nonatomic) ZZCircleProgress *progressView;
@property (weak, nonatomic) IBOutlet UIView *floatView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) dispatch_source_t timer;
@property (weak, nonatomic) IBOutlet UIImageView *floatInfoImageView;
@property (weak, nonatomic) IBOutlet UIButton *floatCoinBtn;
@property (weak, nonatomic) IBOutlet UILabel *floatShangXianLabel;
@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, assign) CGFloat webViewHeight;
@property (nonatomic, strong) MBProgressHUD *hud;
@end
@implementation BWRZQTaskReadViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self addBackBtn];
    [[self addRigthBtnImage:@"share_btn"] addTarget:self action:@selector(sharePress) forControlEvents:UIControlEventTouchUpInside];
    readTimeNum = 0;
    currentReadTimeNum = 0;
    self.scrollView.contentSize = CGSizeMake(0, 2000);
    [self.floatView setFrame:CGRectMake(SCREEN_WIDTH_DEVICE - 66 - 8, SCREEN_HEIGHT_DEVICE - 66 - IS_iPhoneX_Bottom - 30, 66, 66)];
    self.progressView = [[ZZCircleProgress alloc] initWithFrame:CGRectMake(3, 3, 60, 60) pathBackColor:RGB(245, 247, 250) pathFillColor:ThemeColor startAngle:0 strokeWidth:5];
    self.progressView.startAngle = -90;
    self.progressView.showPoint = NO;
    self.progressView.showProgressText = NO;
    self.progressView.increaseFromLast = YES;
    self.progressView.duration = 1.0f;
    [self.floatView addSubview:self.progressView];
    self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.hud.mode = MBProgressHUDModeAnnularDeterminate;
    self.hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    self.hud.bezelView.color = [UIColor colorWithWhite:0.f alpha:0.7f];
    self.hud.label.text =  @"正在加载";
    self.hud.alpha = 0;
    [self.scrollView setFrame:CGRectMake(0, 64 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE, SCREEN_HEIGHT_DEVICE - IS_iPhoneX_Top - 64)];
    self.scrollView.alwaysBounceVertical = YES;
    self.webViewHeight = 0.0;
    [self requestContent];
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    if (self.timer) {
        dispatch_cancel(self.timer);
    }
    currentReadTimeNum = 0;
    self.progressView.progress = 0;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    if (self.timer) {
        dispatch_cancel(self.timer);
        self.timer = nil;
    }
}
- (void)dealloc
{
    [self.webView.scrollView removeObserver:self forKeyPath:@"contentSize"];
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
    [[ServiceRequest sharedService] cancelDataTaskForKey:[NSString stringWithFormat:@"read-task/%@", self.taskId]];
}
- (void)requestContent{
    self.floatView.hidden = YES;
    [[ServiceRequest sharedService] GET:[NSString stringWithFormat:@"read-task/%@", self.taskId] parameters:nil success:^(id responseObject) {
        self->contentDic = responseObject;
        self->readTimeNum = [[self->contentDic objectForKey:@"readSeconds"] floatValue];
        [self createWebView:[self->contentDic objectForKey:@"readLink"]];
    } failure:^(NSString *error, NSInteger code) {
        [self showHUDAlert:error];
    }];
}
- (void)startJiShi{
    count = 10;
    dispatch_queue_t queue = dispatch_get_main_queue();
    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_time_t start = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC));
    uint64_t interval = (uint64_t)(1.0 * NSEC_PER_SEC);
    dispatch_source_set_timer(self.timer, start, interval, 0);
    dispatch_source_set_event_handler(self.timer, ^{
        self->count--;
        NSLog(@"======%ld", (long)self->count);
        if (self->count > 0 && self.progressView.progress < 1.0f) {
            self->currentReadTimeNum++;
            float percentage = self->currentReadTimeNum/self->readTimeNum;
            NSLog(@"++++++=%f", percentage);
            self.progressView.progress = percentage;
            return;
        }else{
            if (self.progressView.progress >= 1) {
                dispatch_cancel(self.timer);
                self.timer = nil;
                NSLog(@"进度结束");
                self.floatInfoImageView.hidden = YES;
                NSMutableDictionary *dic = [NSMutableDictionary dictionary];
                [dic setObject:[NSNumber numberWithLong:[[self->contentDic objectForKey:@"readSeconds"] longValue]] forKey:@"readSeconds"];
                [[ServiceRequest sharedService] POST:[NSString stringWithFormat:@"read-task/read-records/%@", self.taskId] parameters:dic success:^(id responseObject) {
                    self.floatCoinBtn.hidden = NO;
                    [self.floatCoinBtn setTitle:[NSString stringWithFormat:@"+%@", [self->contentDic objectForKey:@"rewardAmount"]] forState:UIControlStateNormal];
                    self.floatShangXianLabel.hidden = YES;
                    self.progressView.progress = 1;
                } failure:^(NSString *error, NSInteger code) {
                }];
            }else{
                dispatch_suspend(self.timer);
            }
        }
    });
    dispatch_resume(self.timer);
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    if (self.progressView.progress < 1.0f) {
        if (count <= 0) {
            dispatch_resume(self.timer);
        }
        count = 10;
    }
}
- (void)createWebView:(NSString *)urlStr
{
    WKWebViewConfiguration *wkWebConfig = [[WKWebViewConfiguration alloc] init];
    WKUserContentController *wkUController = [[WKUserContentController alloc] init];
    wkWebConfig.userContentController = wkUController;
    NSString *jSString = @"var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=device-width'); document.getElementsByTagName('head')[0].appendChild(meta);";
    WKUserScript *wkUserScript = [[WKUserScript alloc] initWithSource:jSString injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
    [wkUController addUserScript:wkUserScript];
    self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH_DEVICE, 1) configuration:wkWebConfig];
    self.webView.backgroundColor = [UIColor clearColor];
    self.webView.opaque = NO;
    self.webView.userInteractionEnabled = NO;
    self.webView.scrollView.bounces = NO;
    self.webView.UIDelegate = self;
    self.webView.navigationDelegate = self;
    [self.webView sizeToFit];
    [self.webView.scrollView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew context:nil];
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:NULL];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:urlRequest];
    [self.scrollView addSubview:self.webView];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"contentSize"]) {
        UIScrollView *scrollView = (UIScrollView *)object;
        CGFloat height = scrollView.contentSize.height;
        self.webViewHeight = height;
        self.webView.frame = CGRectMake(0, 0, SCREEN_WIDTH_DEVICE, height);
        self.scrollView.contentSize =CGSizeMake(self.view.frame.size.width, height);
    }else if ([keyPath isEqualToString:@"estimatedProgress"]){
        if (object == self.webView){
            NSLog(@"=========%f", self.webView.estimatedProgress);
            self.hud.progress = self.webView.estimatedProgress;
            self.hud.alpha = 1.0f;
            if (self.webView.estimatedProgress >= 1.0) {
                [UIView animateWithDuration:0.5 animations:^{
                    self.hud.alpha = 0;
                } completion:^(BOOL finished) {
                    self.hud.progress = 0.0f;
                }];
            }
        }else{
            [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        }
    }
}
#pragma mark - WKScriptMessageHandler
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    NSLog(@"name = %@",message.name);
    NSLog(@"body = %@",message.body);
    NSLog(@"frameInfo = %@",message.frameInfo);
}
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    NSLog(@"开始加载网页");
    self.title = webView.title;
}
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    NSLog(@"加载完成");
    [self hideHudAlert];
    self.title = webView.title;
    self.floatView.hidden = NO;
    addShadowToView(self.floatView, 0.3, 5.0f, 33.0f);
    if ([[contentDic objectForKey:@"read"] boolValue]) {
        self.floatInfoImageView.hidden = YES;
        self.floatCoinBtn.hidden = YES;
        self.floatShangXianLabel.hidden = NO;
        self.progressView.progress = 1;
    }else{
        self.floatInfoImageView.hidden = NO;
        self.floatCoinBtn.hidden = YES;
        self.floatShangXianLabel.hidden = YES;
        [self startJiShi];
    }
}
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    NSLog(@"加载失败");
    [self hideHudAlert];
    [self showHUDAlert:@"加载失败"];
}
- (void)sharePress {
    UserInfo *user = [UserManger currentLoggedInUser];
    ShareView *shareView = [[ShareView alloc] initItemContent:SHARECONTENT withTitle:SHARETITLE withUrl:[NSString stringWithFormat:@"%@?inviter=%@", SHAREAPPURL, user.phone] withShareicon:nil];
    [self.view.window addSubview:shareView];
}
@end
