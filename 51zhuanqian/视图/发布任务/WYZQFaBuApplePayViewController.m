#import "WYZQFaBuApplePayViewController.h"
#import <StoreKit/StoreKit.h>
@interface WYZQFaBuApplePayViewController ()<SKPaymentTransactionObserver,SKProductsRequestDelegate>
@end
@implementation WYZQFaBuApplePayViewController
- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)dealloc{
    [[SKPaymentQueue defaultQueue] removeTransactionObserver:self];
}
- (IBAction)surePress {
    NSArray *product = [NSArray arrayWithObject:@"sjb001"];
    NSSet *nsset = [NSSet setWithArray:product];
    SKProductsRequest *request = [[SKProductsRequest alloc]initWithProductIdentifiers:nsset];
    request.delegate =self;
    [request start];
}
#pragma mark - SKProductsRequestDelegate
- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response{
    NSLog(@"-----------收到产品反馈信息--------------");
    NSArray *myProduct = response.products;
    NSLog(@"产品Product ID:%@",response.invalidProductIdentifiers);
    NSLog(@"产品付费数量: %d", (int)[myProduct count]);
    for(SKProduct *product in myProduct){
        NSLog(@"product info");
        NSLog(@"SKProduct描述信息%@", [product description]);
        NSLog(@"产品标题%@", product.localizedTitle);
        NSLog(@"产品描述信息: %@", product.localizedDescription);
        NSLog(@"价格: %@", product.price);
        NSLog(@"Product id: %@", product.productIdentifier);
        SKPayment *payment = [SKPayment paymentWithProduct:product];
        [[SKPaymentQueue defaultQueue] addPayment:payment];
    }
}
- (void)request:(SKRequest *)request didFailWithError:(NSError *)error{
    NSLog(@"------------------错误-----------------:%@", error);
}
- (void)requestDidFinish:(SKRequest *)request{
    NSLog(@"------------反馈信息结束-----------------");
}
- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transaction{
    [self hideHudAlert];
    for(SKPaymentTransaction *tran in transaction){
        switch(tran.transactionState) {
            case SKPaymentTransactionStatePurchased:
                NSLog(@"交易完成");
                [self showHUDAlert:@"交易成功"];
                [[SKPaymentQueue defaultQueue] finishTransaction:tran];
                [self successAction];
                break;
            case SKPaymentTransactionStatePurchasing:
                NSLog(@"商品添加进列表");
                break;
            case SKPaymentTransactionStateRestored:
                NSLog(@"已经购买过商品");
                break;
            case SKPaymentTransactionStateFailed :{
                NSLog(@"交易失败");
                [[SKPaymentQueue defaultQueue] finishTransaction:tran];
                break;
            }
            default:
                break;
        }
    }
}
- (void)successAction{
    NSLog(@"apple pay 支付成功");
}
@end
