#import "WYZQTiXianGuangLiViewController.h"
#import "WYZQBangdingZhifubaoViewController.h"
#import "WYZQBangdingWeixinViewController.h"
@interface WYZQTiXianGuangLiViewController ()
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UILabel *zhifubaoLabel;
@property (weak, nonatomic) IBOutlet UILabel *weixinLabel;
@end
@implementation WYZQTiXianGuangLiViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"提现管理";
    [self addBackBtn];
    [self.contentView setFrame:CGRectMake(0, 84 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE, self.contentView.frame.size.height)];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
- (IBAction)zhifubaoPress {
    WYZQBangdingZhifubaoViewController *viewCon = [[WYZQBangdingZhifubaoViewController alloc] initWithNibName:@"WYZQBangdingZhifubaoViewController" bundle:nil];
    [self.navigationController pushViewController:viewCon animated:YES];
}
- (IBAction)weixinPress {
    WYZQBangdingWeixinViewController *viewCon = [[WYZQBangdingWeixinViewController alloc] initWithNibName:@"WYZQBangdingWeixinViewController" bundle:nil];
    [self.navigationController pushViewController:viewCon animated:YES];
}
@end
