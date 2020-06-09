#import "BWRZQFaBuPayViewController.h"
#import "Order.h"
#import "RSADataSigner.h"
#import <AlipaySDK/AlipaySDK.h>
#import "WXApi.h"
#import "GlobalFunction.h"
@interface BWRZQFaBuPayViewController (){
    BOOL hasloaded;
    float keyongNum;
    float price;
}
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIView *paymentView;
@property (weak, nonatomic) IBOutlet UIImageView *zhifubaoImageView;
@property (weak, nonatomic) IBOutlet UIImageView *weixinImageView;
@property (weak, nonatomic) IBOutlet UIButton *zhifubaoBtn;
@property (weak, nonatomic) IBOutlet UIButton *weixinBtn;
@property (weak, nonatomic) IBOutlet UIImageView *lineOneImageView;
@property (weak, nonatomic) IBOutlet UILabel *weixinLabel;
@property (weak, nonatomic) IBOutlet UIImageView *weixinIcon;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@property (weak, nonatomic) IBOutlet UIButton *dikouBtn;
@property (weak, nonatomic) IBOutlet UIButton *budikouBtn;
@property (weak, nonatomic) IBOutlet UILabel *yueLabel;
@end
@implementation BWRZQFaBuPayViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"付款";
    [self addBackBtn];
    [self.scrollView setFrame:CGRectMake(0, 64 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE, self.scrollView.frame.size.height)];
    if ([WXApi isWXAppInstalled]) {
        [self.paymentView setFrame:CGRectMake(0, self.paymentView.frame.origin.y, SCREEN_WIDTH_DEVICE, 88)];
        self.lineOneImageView.hidden = NO;
        self.weixinBtn.hidden = NO;
        self.weixinIcon.hidden = NO;
        self.weixinLabel.hidden = NO;
        self.weixinImageView.hidden = NO;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getOrderPayResult:) name:@"wx_pay" object:nil];
    }else{
        [self.paymentView setFrame:CGRectMake(0, self.paymentView.frame.origin.y, SCREEN_WIDTH_DEVICE, 44)];
        self.lineOneImageView.hidden = YES;
        self.weixinBtn.hidden = YES;
        self.weixinIcon.hidden = YES;
        self.weixinLabel.hidden = YES;
        self.weixinImageView.hidden = YES;
    }
    self.zhifubaoBtn.selected = YES;
    self.zhifubaoImageView.image = [UIImage imageNamed:@"circle_select"];
    self.weixinBtn.selected = NO;
    self.weixinImageView.image = [UIImage imageNamed:@"circle_nomal"];
    [self.sureBtn setFrame:CGRectMake(0, SCREEN_HEIGHT_DEVICE - IS_iPhoneX_Bottom - 44, SCREEN_WIDTH_DEVICE, 44)];
    [self.sureBtn setBackgroundImage:getColorToImage(ThemeColor) forState:UIControlStateNormal];
    self.dikouBtn.selected = YES;
    self.scrollView.hidden = YES;
    self.sureBtn.hidden = YES;
    [self loadingHUDAlert:@"正在加载"];
    [self getUserAmount];
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if (hasloaded) {
        [self getUserAmount];
    }
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    hasloaded = YES;
}
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}
- (void)dealloc{
    UserInfo *user = [UserManger currentLoggedInUser];
    [[ServiceRequest sharedService] cancelDataTaskForKey:[NSString stringWithFormat:@"user/%@/account", user.userID]];
    [[ServiceRequest sharedService] cancelDataTaskForKey:[NSString stringWithFormat:@"payment/%@", self.taskId]];
    [[ServiceRequest sharedService] cancelDataTaskForKey:[NSString stringWithFormat:@"payment/wechat/%@", self.taskId]];
}
- (void)getUserAmount{
    UserInfo *user = [UserManger currentLoggedInUser];
    [[ServiceRequest sharedService] GET:[NSString stringWithFormat:@"user/%@/account", user.userID] parameters:nil success:^(id responseObject) {
        [self hideHudAlert];
        self.scrollView.hidden = NO;
        self.sureBtn.hidden = NO;
        NSDictionary *contentDic = responseObject;
        user.availableAmount = [NSString stringWithFormat:@"%.2f", [[contentDic objectForKey:@"availableAmount"] floatValue]];
        [UserManger setUser:user];
        self.yueLabel.text = [NSString stringWithFormat:@"余额：￥%@",  user.availableAmount];
        self->keyongNum = [[contentDic objectForKey:@"availableAmount"] floatValue];
        self->price = [[self.amountStr substringFromIndex:1] floatValue];
        NSString *str = nil;
        if (self->price <= self->keyongNum) {
            str = [NSString stringWithFormat:@" 抵扣￥%.2f", self->price];
            self.priceLabel.text = [NSString stringWithFormat:@"￥%d", 0];
        }else{
            str = [NSString stringWithFormat:@" 抵扣￥%.2f", self->keyongNum];
            self.priceLabel.text = [NSString stringWithFormat:@"￥%.2f", self->price - self->keyongNum];
        }
        CGSize labelSize = [str boundingRectWithSize:CGSizeMake(SCREEN_WIDTH_DEVICE - 150, MAX_INPUT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13.0]} context:nil].size;
        [self.dikouBtn setFrame:CGRectMake(SCREEN_WIDTH_DEVICE - 15 - labelSize.width - 25, 134, labelSize.width + 25, 44)];
        [self.dikouBtn setTitle:str forState:UIControlStateNormal];
        [self.budikouBtn setFrame:CGRectMake(self.dikouBtn.frame.origin.x - 65, 134, 65, 44)];
    } failure:^(NSString *error, NSInteger code) {
        [self hideHudAlert];
        [self showHUDAlert:error];
    }];
}
- (IBAction)budikouPress {
    self.budikouBtn.selected = YES;
    self.dikouBtn.selected = NO;
    self.priceLabel.text = [NSString stringWithFormat:@"￥%.2f", price];
}
- (IBAction)dikouPress {
    self.budikouBtn.selected = NO;
    self.dikouBtn.selected = YES;
    if (price <= keyongNum) {
        self.priceLabel.text = [NSString stringWithFormat:@"￥%d", 0];
    }else{
        self.priceLabel.text = [NSString stringWithFormat:@"￥%.2f", price - keyongNum];
    }
}
- (IBAction)zhifubaoPress {
    if (!self.zhifubaoBtn.selected) {
        self.zhifubaoBtn.selected = YES;
        self.zhifubaoImageView.image = [UIImage imageNamed:@"circle_select"];
        self.weixinBtn.selected = NO;
        self.weixinImageView.image = [UIImage imageNamed:@"circle_nomal"];
    }
}
- (IBAction)weixinPress {
    if (!self.weixinBtn.selected) {
        self.weixinBtn.selected = YES;
        self.weixinImageView.image = [UIImage imageNamed:@"circle_select"];
        self.zhifubaoBtn.selected = NO;
        self.zhifubaoImageView.image = [UIImage imageNamed:@"circle_nomal"];
    }
}
- (IBAction)surePress {
    float deductAmount = 0;
    if (self.dikouBtn.selected) {
        if (price <= keyongNum) {
            deductAmount = price;
        }else{
            deductAmount = keyongNum;
        }
    }
    if ([[self.priceLabel.text substringFromIndex:1] floatValue] == 0) {
        [self loadingHUDAlert:@"正在支付"];
        [[ServiceRequest sharedService] POST:[NSString stringWithFormat:@"payment/%@/balance", self.taskId] parameters:[NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:deductAmount] forKey:@"deductAmount"] success:^(id responseObject) {
            [self hideHudAlert];
            [self paySuccess];
        } failure:^(NSString *error, NSInteger code) {
            [self hideHudAlert];
            [self showHUDAlert:error];
        }];
    }else{
        if (self.zhifubaoBtn.selected) {
            [self requestOrder:deductAmount];
        }else{
            [self wechatPayClick:deductAmount];
        }
    }
}
- (void)requestOrder:(float)deductAmount{
    [self loadingHUDAlert:@"正在生成订单..."];
    [[ServiceRequest sharedService] POST:[NSString stringWithFormat:@"payment/%@", self.taskId] parameters:[NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:deductAmount] forKey:@"deductAmount"] success:^(id responseObject) {
        [self hideHudAlert];
        NSLog(@"%@", responseObject);
        NSString *orderStr = [NSString stringWithFormat:@"%@", [responseObject objectForKey:@"orderString"]];
        [self doAlipayPay:orderStr];
    } failure:^(NSString *error, NSInteger code) {
        [self hideHudAlert];
        [self showHUDAlert:error];
    }];
}
#pragma mark -
#pragma mark   ==============点击订单模拟支付行为==============
- (void)doAlipayPay:(NSString *)orderStr
{
    if (orderStr != nil) {
        NSString *appScheme = @"BWR51ZQ";
        [[AlipaySDK defaultService] payOrder:orderStr fromScheme:appScheme callback:^(NSDictionary *resultDic) {
            NSLog(@"reslut = %@",resultDic);
            if ([[resultDic objectForKey:@"resultStatus"] isEqualToString:@"9000"]) {
                [self paySuccess];
            }else{
                [self showHUDAlert:@"支付失败"];
            }
        }];
    }
}
- (void)paySuccess{
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    if (self.RefreshHandle) {
        self.RefreshHandle();
    }
    [self showHUDAlert:@"支付成功"];
    [self performSelector:@selector(goBackAction) withObject:self afterDelay:2.0f];
}
- (NSString *)generateTradeNO
{
    static int kNumber = 15;
    NSString *sourceStr = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSMutableString *resultStr = [[NSMutableString alloc] init];
    srand((unsigned)time(0));
    for (int i = 0; i < kNumber; i++)
    {
        unsigned index = rand() % [sourceStr length];
        NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
        [resultStr appendString:oneStr];
    }
    return resultStr;
}
- (void)wechatPayClick:(float)deductAmount
{
    [self loadingHUDAlert:@"正在下单"];
    [[ServiceRequest sharedService] POST:[NSString stringWithFormat:@"payment/wechat/%@", self.taskId] parameters:[NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:deductAmount] forKey:@"deductAmount"] success:^(id responseObject) {
        [self hideHudAlert];
        NSDictionary *dataDic = responseObject;
        if (dataDic) {
            PayReq *req   = [[PayReq alloc] init];
            req.partnerId = [dataDic objectForKey:@"partnerid"];
            req.prepayId  = [dataDic objectForKey:@"prepayid"];
            req.package   = [dataDic objectForKey:@"packageValue"];
            req.nonceStr  = [dataDic objectForKey:@"noncestr"];
            req.timeStamp = [[dataDic objectForKey:@"timestamp"] intValue];
            req.sign = [dataDic objectForKey:@"sign"];
            [WXApi sendReq:req completion:^(BOOL success) {
                if (success) {
//                    [self paySuccess];
                }else{
                    [self showHUDAlert:@"支付失败"];
                }
            }];
        }else{
            [self showHUDAlert:@"支付失败"];
        }
    } failure:^(NSString *error, NSInteger code) {
        [self hideHudAlert];
        [self showHUDAlert:error];
    }];
}
#pragma mark -微信支付结果回调
-(void)getOrderPayResult:(NSNotification *)notification{
    if ([notification.object isEqualToString:@"success"]){
        [self paySuccess];
    } else{
        [self showHUDAlert:@"支付失败"];
    }
}
@end
