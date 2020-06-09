#import "BWRZQTaskDoingDetailProcessViewController.h"
#import "LXGradientProcessView.h"
#import "BWRZQTaskDoingShowSubmitTaskViewController.h"
@interface BWRZQTaskDoingDetailProcessViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) LXGradientProcessView *processView;
@end
@implementation BWRZQTaskDoingDetailProcessViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView.alwaysBounceVertical = YES;
    [self requestContent];
}
- (void)dealloc{
    [[ServiceRequest sharedService] cancelDataTaskForKey:[NSString stringWithFormat:@"task-order/%@/process", self.orderId]];
}
- (void)requestContent{
    [self loadingHUDAlert:@"正在加载"];
    [[ServiceRequest sharedService] GET:[NSString stringWithFormat:@"task-order/%@/process", self.orderId] parameters:nil success:^(id responseObject) {
        [self hideHudAlert];
        float originY = 30;
            float lastOriginY = 30;
            for (int i = 0; i < [responseObject count]; i++) {
                if (i > 0) {
                    UIImageView *lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(35, lastOriginY + 10, 0.5, originY - lastOriginY - 10)];
                    [lineImageView setBackgroundColor:ThemeColor];
                    [self.view addSubview:lineImageView];
                    lastOriginY = originY;
                }else{
                    lastOriginY = originY;
                }
                NSDictionary *dic = [responseObject objectAtIndex:i];
                UIImageView *dot = [[UIImageView alloc] initWithFrame:CGRectMake(30, originY, 10, 10)];
                dot.layer.masksToBounds = YES;
                dot.layer.cornerRadius = 5.0f;
                dot.layer.borderColor = ThemeColor.CGColor;
                dot.layer.borderWidth = 0.5f;
                [self.view addSubview:dot];
                UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(48, originY-5, SCREEN_HEIGHT_DEVICE - 48 - 8, 20)];
                titleLabel.text = [dic objectForKey:@"stepTitle"];
                titleLabel.textColor = TextColor;
                titleLabel.font = [UIFont systemFontOfSize:15.0f];
                [self.view addSubview:titleLabel];
                if ([[dic objectForKey:@"showSubmitResult"] boolValue]) {
                    UIButton *showSubmit = [[UIButton alloc] initWithFrame:CGRectMake(41, titleLabel.frame.size.height + originY, 140, 30)];
                    [showSubmit setTitle:@"查看提交的任务结果" forState:UIControlStateNormal];
                    [showSubmit setImage:[UIImage imageNamed:@"shoutu_more_btn"] forState:UIControlStateNormal];
                    [showSubmit setTitleColor:ThemeColor forState:UIControlStateNormal];
                    showSubmit.titleLabel.font = [UIFont systemFontOfSize:13.0f];
                    [showSubmit setTitleEdgeInsets:UIEdgeInsetsMake(0, -
                     showSubmit.imageView.frame.size.width, 0, showSubmit.imageView.frame.size.width)];
                    [showSubmit setImageEdgeInsets:UIEdgeInsetsMake(0, showSubmit.titleLabel.bounds.size.width, 0, - showSubmit.titleLabel.bounds.size.width - 5)];
                    [showSubmit addTarget:self action:@selector(showSumbitPress) forControlEvents:UIControlEventTouchUpInside];
                    [self.view addSubview:showSubmit];
                    originY = originY + 60;
                }else{
                    NSString *commentStr = [dic objectForKey:@"stepComment"];
                    if (commentStr.length > 0) {
                        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:commentStr];
                        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
                        [paragraphStyle setLineSpacing:4];
                        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [commentStr length])];
                        CGSize labelSize = [commentStr boundingRectWithSize:CGSizeMake(SCREEN_WIDTH_DEVICE - 48 - 8, MAX_INPUT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13.0], NSParagraphStyleAttributeName:paragraphStyle} context:nil].size;
                        UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(48, titleLabel.frame.size.height + originY + 8, labelSize.width, labelSize.height)];
                        contentLabel.textColor = TextColor;
                        contentLabel.text = commentStr;
                        contentLabel.attributedText = attributedString;
                        contentLabel.numberOfLines = 0;
                        contentLabel.font = [UIFont systemFontOfSize:13.0f];
                        [self.view addSubview:contentLabel];
                        originY = contentLabel.frame.origin.y + contentLabel.frame.size.height + 10;
                    }else{
                        originY = originY + 60;
                    }
                }
            }
    } failure:^(NSString *error, NSInteger code) {
        [self hideHudAlert];
        [self showHUDAlert:error];
    }];
}
- (void)showSumbitPress{
    BWRZQTaskDoingShowSubmitTaskViewController *viewCon = [[BWRZQTaskDoingShowSubmitTaskViewController alloc] initWithNibName:@"BWRZQTaskDoingShowSubmitTaskViewController" bundle:nil];
    viewCon.taskId = self.taskId;
    viewCon.orderId = self.orderId;
    [self.navigationController pushViewController:viewCon animated:YES];
}
@end
