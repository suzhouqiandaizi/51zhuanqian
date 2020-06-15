#import "WYZQTixianResultViewController.h"
@interface WYZQTixianResultViewController ()
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@property (weak, nonatomic) IBOutlet UIImageView *infoImageView;
@property (weak, nonatomic) IBOutlet UILabel *infoTitle;
@property (weak, nonatomic) IBOutlet UILabel *infoContent;
@end
@implementation WYZQTixianResultViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"提现结果";
    self.sureBtn.layer.masksToBounds = YES;
    self.sureBtn.layer.cornerRadius = 22.0f;
    if ([self.result isEqualToString:@"success"]) {
        self.infoImageView.image = [UIImage imageNamed:@"tician_chengong_pic"];
        self.infoTitle.text = @"提现成功";
        self.infoContent.text = @"";
    }else{
        self.infoImageView.image = [UIImage imageNamed:@"tixian_shibai_pic"];
        self.infoTitle.text = @"提现失败";
        self.infoContent.text = self.result;
    }
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
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count - 3] animated:YES];
}
- (IBAction)customBackPress {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
