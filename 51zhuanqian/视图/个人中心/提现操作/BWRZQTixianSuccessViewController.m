#import "BWRZQTixianSuccessViewController.h"
#import "GlobalFunction.h"
#import "BWRZQPersonViewController.h"
#import "SharedViewControllers.h"
@interface BWRZQTixianSuccessViewController ()
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@end
@implementation BWRZQTixianSuccessViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self addCustomBackBtn];
    self.title = @"提现结果";
    [self.contentView setFrame:CGRectMake(0, 64 + IS_iPhoneX_Top + 60, SCREEN_WIDTH_DEVICE, self.contentView.frame.size.height)];
    self.sureBtn.layer.masksToBounds = YES;
    self.sureBtn.layer.cornerRadius = 5.0f;
    [self.sureBtn setBackgroundImage:getColorToImage(ThemeColor) forState:UIControlStateNormal];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.fd_interactivePopDisabled = YES;
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.fd_interactivePopDisabled = NO;
}
- (IBAction)surePress {
    [self.navigationController popToViewController:[SharedViewControllers personViewCon] animated:YES];
}
- (void)addCustomBackBtn{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake(0, 0, 40, 40);
    [btn setImage:[UIImage imageNamed:@"back_btn"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(goCustomBackAction) forControlEvents:UIControlEventTouchUpInside];
    if (IOS11_OR_LATER) {
        btn.contentHorizontalAlignment =UIControlContentHorizontalAlignmentLeft;
        [btn setImageEdgeInsets:UIEdgeInsetsMake(0, -5 *SCREEN_WIDTH_DEVICE /375.0,0,0)];
    }
    UIBarButtonItem *btn_left = [[UIBarButtonItem alloc] initWithCustomView:btn];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -15;
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:negativeSpacer, btn_left, nil];
}
- (void)goCustomBackAction{
    [self surePress];
}
@end
