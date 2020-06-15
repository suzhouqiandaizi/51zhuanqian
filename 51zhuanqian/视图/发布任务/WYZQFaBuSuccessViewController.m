#import "WYZQFaBuSuccessViewController.h"
#import "GlobalFunction.h"
#import "SharedViewControllers.h"
#import "WYZQHomeViewController.h"
#import "WYZQFaBuDetailTwoViewController.h"
@interface WYZQFaBuSuccessViewController ()
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@property (weak, nonatomic) IBOutlet UIView *topView;
@end
@implementation WYZQFaBuSuccessViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"发布任务";
    self.sureBtn.layer.masksToBounds = YES;
    self.sureBtn.layer.cornerRadius = 5.0f;
    [self.sureBtn setBackgroundImage:getColorToImage(ThemeColor) forState:UIControlStateNormal];
    [self addCustomBackBtn];
    [self.topView setFrame:CGRectMake(0, 64 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE, self.topView.frame.size.height)];
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
    if (self.againCreate) {
        [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count - 3] animated:YES];
    }else{
        [self customBackPress];
    }
}
- (IBAction)customBackPress {
    [self.navigationController popToViewController:[SharedViewControllers homeViewCon] animated:YES];
}
- (IBAction)showPress {
    WYZQFaBuDetailTwoViewController *viewCon = [[WYZQFaBuDetailTwoViewController alloc] initWithNibName:@"WYZQFaBuDetailTwoViewController" bundle:nil];
    viewCon.taskId = self.taskId;
    viewCon.taskCategoryStr = self.taskCategoryStr;
    [self.navigationController pushViewController:viewCon animated:YES];
}
@end
