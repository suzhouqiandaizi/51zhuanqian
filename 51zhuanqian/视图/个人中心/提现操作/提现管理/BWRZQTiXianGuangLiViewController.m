#import "BWRZQTiXianGuangLiViewController.h"
#import "BWRZQBangdingZhifubaoViewController.h"
#import "BWRZQBangdingWeixinViewController.h"
@interface BWRZQTiXianGuangLiViewController ()
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UILabel *zhifubaoLabel;
@property (weak, nonatomic) IBOutlet UILabel *weixinLabel;
@end
@implementation BWRZQTiXianGuangLiViewController
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
    BWRZQBangdingZhifubaoViewController *viewCon = [[BWRZQBangdingZhifubaoViewController alloc] initWithNibName:@"BWRZQBangdingZhifubaoViewController" bundle:nil];
    [self.navigationController pushViewController:viewCon animated:YES];
}
- (IBAction)weixinPress {
    BWRZQBangdingWeixinViewController *viewCon = [[BWRZQBangdingWeixinViewController alloc] initWithNibName:@"BWRZQBangdingWeixinViewController" bundle:nil];
    [self.navigationController pushViewController:viewCon animated:YES];
}
@end
