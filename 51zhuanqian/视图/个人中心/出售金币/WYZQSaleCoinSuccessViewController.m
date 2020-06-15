#import "WYZQSaleCoinSuccessViewController.h"
#import "GlobalFunction.h"
@interface WYZQSaleCoinSuccessViewController ()
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@end
@implementation WYZQSaleCoinSuccessViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self addBackBtn];
    self.title = @"出售结果";
    [self.contentView setFrame:CGRectMake(0, 64 + IS_iPhoneX_Top + 60, SCREEN_WIDTH_DEVICE, self.contentView.frame.size.height)];
    self.sureBtn.layer.masksToBounds = YES;
    self.sureBtn.layer.cornerRadius = 5.0f;
    [self.sureBtn setBackgroundImage:getColorToImage(ThemeColor) forState:UIControlStateNormal];
}
- (IBAction)surePress {
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count - 3] animated:YES];
}
@end
