#import "WYZQFaBuViewController.h"
#import <WebKit/WebKit.h>
#import "MBProgressHUD.h"
@interface WYZQFaBuViewController ()<WKUIDelegate, WKNavigationDelegate, WKScriptMessageHandler>
@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, assign) CGFloat webViewHeight;
@property (nonatomic, strong) MBProgressHUD *hud;
@end
@implementation WYZQFaBuViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"发布任务";
    [self addBackBtn];
    self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.hud.mode = MBProgressHUDModeAnnularDeterminate;
    self.hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    self.hud.bezelView.color = [UIColor colorWithWhite:0.f alpha:0.7f];
    self.hud.label.text =  @"正在加载";
    self.hud.alpha = 0;
    self.webViewHeight = 0.0;
    [self createWebView];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
- (void)dealloc
{
    [self.webView.scrollView removeObserver:self forKeyPath:@"contentSize"];
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}
- (void)createWebView
{
    WKWebViewConfiguration *wkWebConfig = [[WKWebViewConfiguration alloc] init];
    WKUserContentController *wkUController = [[WKUserContentController alloc] init];
    [wkUController addScriptMessageHandler:self name:@"jsCallOCFunction"];
    wkWebConfig.userContentController = wkUController;
    NSString *jSString = @"var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=device-width'); document.getElementsByTagName('head')[0].appendChild(meta);";
    WKUserScript *wkUserScript = [[WKUserScript alloc] initWithSource:jSString injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
    [wkUController addUserScript:wkUserScript];
    self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 64 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE, SCREEN_HEIGHT_DEVICE - IS_iPhoneX_Top - 64) configuration:wkWebConfig];
    self.webView.backgroundColor = [UIColor clearColor];
    self.webView.opaque = NO;
    self.webView.userInteractionEnabled = YES;
    self.webView.scrollView.bounces = YES;
    self.webView.UIDelegate = self;
    self.webView.navigationDelegate = self;
    [self.webView sizeToFit];
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:NULL];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/AwardWinner/index.html#/pages/views/select-release-task/select-release-task", HOSTURL]];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:urlRequest];
    [self.webView reload];
    [self.view addSubview:self.webView];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"contentSize"]) {
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
    [self hideHudAlert];
}
-(NSString *)convertJSONWithDic:(NSDictionary *)dic {
    NSError *err;
    NSData *data = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&err];
    if (err) {
        return @"字典转JSON出错";
    }
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    NSLog(@"加载失败");
    [self hideHudAlert];
    [self showHUDAlert:@"加载失败"];
}
-(void)webView:(WKWebView*)webView decidePolicyForNavigationAction:(WKNavigationAction*)navigationAction decisionHandler:(void(^)(WKNavigationActionPolicy))decisionHandler{
    if(navigationAction.targetFrame ==nil) {
        [webView loadRequest:navigationAction.request];
    }
    decisionHandler(WKNavigationActionPolicyAllow);
}
-(WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures{
    if (!navigationAction.targetFrame.isMainFrame) {
        [webView loadRequest:navigationAction.request];
    }
    return nil;
}
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:message
                                                                             message:nil
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK"
                                                        style:UIAlertActionStyleCancel
                                                      handler:^(UIAlertAction *action) {
                                                          completionHandler();
                                                      }]];
    [self presentViewController:alertController animated:YES completion:^{}];
}
@end
