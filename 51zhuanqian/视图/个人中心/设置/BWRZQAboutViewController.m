#import "BWRZQAboutViewController.h"
#import "LoadConfig.h"
#import "WZYLabel.h"
@interface BWRZQAboutViewController ()<UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UILabel *versionLabel;
@property (weak, nonatomic) IBOutlet UILabel *oneTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *twoTitleLabel;
@property (weak, nonatomic) IBOutlet WZYLabel *oneContentLabel;
@property (weak, nonatomic) IBOutlet WZYLabel *twoContentLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomLabel;
@end
@implementation BWRZQAboutViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"关于我们";
    [self addBackBtn];
    self.twoContentLabel.shouldGestureRecognizer = YES;
    self.twoContentLabel.copyEnable = YES;
    self.oneContentLabel.shouldGestureRecognizer = YES;
    self.oneContentLabel.copyEnable = YES;
    UITapGestureRecognizer *tapRecognize = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)];
    tapRecognize.numberOfTapsRequired = 1;
    tapRecognize.delegate = self;
    [tapRecognize setEnabled :YES];
    [tapRecognize delaysTouchesBegan];
    [tapRecognize cancelsTouchesInView];
    [self.oneContentLabel addGestureRecognizer:tapRecognize];
    [self.contentView setFrame:CGRectMake(0, 74 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE, self.contentView.frame.size.height)];
    [self.bottomLabel setFrame:CGRectMake(0, SCREEN_HEIGHT_DEVICE - IS_iPhoneX_Bottom - 28, SCREEN_WIDTH_DEVICE, 28)];
    self.versionLabel.text = [NSString stringWithFormat:@"V%@",[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]];
    NSDictionary *configDic = [[LoadConfig shareStance] getConfig];
    [self showContent:[configDic objectForKey:@"aboutOur"]];
}
#pragma UIGestureRecognizer Handles
-(void) handleTap:(UITapGestureRecognizer *)recognizer
{
    NSMutableString *str=[[NSMutableString alloc] initWithFormat:@"telprompt://%@",self.oneContentLabel.text];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}
- (void)showContent:(NSDictionary *)dic{
    NSString *kefurexianStr = [dic objectForKey:@"kefurexian"];
    CGSize labelSize = [kefurexianStr boundingRectWithSize:CGSizeMake(SCREEN_WIDTH_DEVICE - 28, MAX_INPUT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0]} context:nil].size;
    [self.oneContentLabel setFrame:CGRectMake(SCREEN_WIDTH_DEVICE - labelSize.width - 8, self.oneContentLabel.frame.origin.y, labelSize.width, self.oneContentLabel.frame.size.height)];
    self.oneContentLabel.text = kefurexianStr;
    NSDictionary *attribtDic = @{NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
     NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:kefurexianStr attributes:attribtDic];
     self.oneContentLabel.attributedText = attribtStr;
    NSString *weixingongzhonghaoStr = [dic objectForKey:@"weixingongzhonghao"];
    labelSize = [weixingongzhonghaoStr boundingRectWithSize:CGSizeMake(SCREEN_WIDTH_DEVICE - 28, MAX_INPUT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0]} context:nil].size;
    [self.twoContentLabel setFrame:CGRectMake(SCREEN_WIDTH_DEVICE - labelSize.width - 8, self.twoContentLabel.frame.origin.y, labelSize.width, self.twoContentLabel.frame.size.height)];
    self.twoContentLabel.text = weixingongzhonghaoStr;
}
@end
