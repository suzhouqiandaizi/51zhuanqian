#import "WYZQTaskDetailViewController.h"
#import "GlobalFunction.h"
#import <WebKit/WebKit.h>
#import "ShareView.h"
#import "WYZQSubmitTaskViewController.h"
#import "WYZQLoginViewController.h"
#import "MBProgressHUD.h"
@interface WYZQTaskDetailViewController ()<UINavigationControllerDelegate,WKUIDelegate, WKNavigationDelegate, WKScriptMessageHandler>{
}
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIView *taskItemView;
@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, assign) CGFloat webViewHeight;
@property (nonatomic, strong) MBProgressHUD *hud;
@end
@implementation WYZQTaskDetailViewController
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    BOOL isShowHomePage = [viewController isKindOfClass:[self class]];
    [self.navigationController setNavigationBarHidden:isShowHomePage animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.fd_prefersNavigationBarHidden = YES;
    self.navigationController.delegate = self;
    self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.hud.mode = MBProgressHUDModeAnnularDeterminate;
    self.hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    self.hud.bezelView.color = [UIColor colorWithWhite:0.f alpha:0.7f];
    self.hud.label.text =  @"正在加载";
    self.hud.alpha = 0;
    [self.bgImageView setFrame:CGRectMake(0, 0, SCREEN_WIDTH_DEVICE, 116 + IS_iPhoneX_Top)];
    self.topView.hidden = YES;
    [self.topView setFrame:CGRectMake(0, 0, SCREEN_WIDTH_DEVICE, 64 + IS_iPhoneX_Top)];
    [self.bottomView setFrame:CGRectMake(0, SCREEN_HEIGHT_DEVICE - 50 - IS_iPhoneX_Bottom, SCREEN_WIDTH_DEVICE, 50)];
    self.priceLabel = changeLabelAttribute(self.priceLabel, self.priceLabel.text.length - 1, 0, ThemeColor, ThemeColor, 13.0);
    [self.scrollView setFrame:CGRectMake(0, 0 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE, SCREEN_HEIGHT_DEVICE - IS_iPhoneX_Top - 50 - IS_iPhoneX_Bottom)];
    self.scrollView.alwaysBounceVertical = YES;
    addShadowToView(self.taskItemView, 0.3, 5.0f, 5.0f);
    self.webViewHeight = 0.0;
    [self createWebView];
    [self showButton];
}
- (IBAction)backExPress {
    [self goBackAction];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if (self.navigationController.delegate == self){
        self.navigationController.delegate = nil;
    }
}
- (void)dealloc
{
    [self.webView.scrollView removeObserver:self forKeyPath:@"contentSize"];
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}
- (void)showButton{
}
- (void)lingquPress{
    if ([UserManger hasUserLogged]) {
        WYZQSubmitTaskViewController *viewCon = [[WYZQSubmitTaskViewController alloc] initWithNibName:@"WYZQSubmitTaskViewController" bundle:nil];
        [self.navigationController pushViewController:viewCon animated:YES];
    }else{
        WYZQLoginViewController *viewCon = [[WYZQLoginViewController alloc] initWithNibName:@"WYZQLoginViewController" bundle:nil];
        viewCon.RefreshHandle = ^(){
            [self lingquPress];
        };
        CustomNavigationCoutroller *navCon = [[CustomNavigationCoutroller alloc] initWithRootViewController:viewCon];
        navCon.modalPresentationStyle = UIModalPresentationFullScreen;
        [self.navigationController presentViewController:navCon animated:YES completion:nil];
    }
}
- (void)createWebView
{
    WKWebViewConfiguration *wkWebConfig = [[WKWebViewConfiguration alloc] init];
    WKUserContentController *wkUController = [[WKUserContentController alloc] init];
    wkWebConfig.userContentController = wkUController;
    NSString *jSString = @"var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=device-width'); document.getElementsByTagName('head')[0].appendChild(meta);";
    WKUserScript *wkUserScript = [[WKUserScript alloc] initWithSource:jSString injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
    [wkUController addUserScript:wkUserScript];
    self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 168, SCREEN_WIDTH_DEVICE, 1) configuration:wkWebConfig];
    self.webView.backgroundColor = [UIColor clearColor];
    self.webView.opaque = NO;
    self.webView.userInteractionEnabled = NO;
    self.webView.scrollView.bounces = NO;
    self.webView.UIDelegate = self;
    self.webView.navigationDelegate = self;
    [self.webView sizeToFit];
    [self.webView.scrollView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew context:nil];
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:NULL];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/app_51zhuanqian/renwu1.html", HOSTURL]];
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
        self.webView.frame = CGRectMake(0, 168, SCREEN_WIDTH_DEVICE, height);
        self.scrollView.contentSize =CGSizeMake(self.view.frame.size.width, height + 168);
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
}
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    NSLog(@"加载完成");
}
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    NSLog(@"加载失败");
    [self hideHudAlert];
    [self showHUDAlert:@"加载失败"];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat yOffset = scrollView.contentOffset.y;
    if (yOffset > 0) {
        self.topView.hidden = NO;
    }else{
        self.topView.hidden = YES;
    }
    if (yOffset < 0) {
        CGFloat factor = ((ABS(yOffset)+(116 + IS_iPhoneX_Top))*SCREEN_WIDTH_DEVICE)/(116  + IS_iPhoneX_Top);
        CGRect f = CGRectMake(0, 0, factor, (116  + IS_iPhoneX_Top)+ABS(yOffset));
        self.bgImageView.frame = f;
    } else {
        if (yOffset < (116 * SCREEN_SCALE + IS_iPhoneX_Top)) {
            CGRect f = self.bgImageView.frame;
            f.size.height = -yOffset + (116 + IS_iPhoneX_Top);
            self.bgImageView.frame = f;
        }
    }
}
- (IBAction)sharePress {
    UserInfo *user = [UserManger currentLoggedInUser];
    ShareView *shareView = [[ShareView alloc] initItemContent:SHARECONTENT withTitle:SHARETITLE withUrl:[NSString stringWithFormat:@"%@?inviter=%@", SHAREAPPURL, user.phone] withShareicon:nil];
    [self.view.window addSubview:shareView];
}
@end
