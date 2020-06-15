#import "WYZQTaskFabuDetailProcessViewController.h"
#import "LXGradientProcessView.h"
@interface WYZQTaskFabuDetailProcessViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) LXGradientProcessView *processView;
@end
@implementation WYZQTaskFabuDetailProcessViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView.alwaysBounceVertical = YES;
    float originY = 30;
    float lastOriginY = 30;
    for (int i = 0; i < self.contentArr.count; i++) {
        NSDictionary *dic = [self.contentArr objectAtIndex:i];
        if (i > 0) {
            UIImageView *lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(21, lastOriginY + 10, 1, originY - lastOriginY - 10)];
            [lineImageView setBackgroundColor:ThemeColor];
            [self.scrollView addSubview:lineImageView];
            [self.scrollView sendSubviewToBack:lineImageView];
            lastOriginY = originY;
        }else{
            lastOriginY = originY;
        }
        UIImageView *dot = [[UIImageView alloc] initWithFrame:CGRectMake(15, originY, 12, 12)];
        dot.layer.masksToBounds = YES;
        dot.layer.cornerRadius = 6.0f;
        dot.layer.borderColor = ThemeColor.CGColor;
        dot.layer.borderWidth = 1.0f;
        [dot setBackgroundColor:[UIColor whiteColor]];
        [self.scrollView addSubview:dot];
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(33, originY-4, SCREEN_HEIGHT_DEVICE - 33 - 8, 20)];
        titleLabel.text = [dic objectForKey:@"stepTitle"];
        titleLabel.textColor = TextColor;
        titleLabel.font = [UIFont systemFontOfSize:15.0f];
        [self.scrollView addSubview:titleLabel];
        BOOL showProcess = [[dic objectForKey:@"displayComplete"] boolValue];
        if (showProcess) {
            self.processView = [[LXGradientProcessView alloc] initWithFrame:CGRectMake(33, originY + 20, SCREEN_WIDTH_DEVICE - 33 - 32, 20) withColorArr:@[(id)[ThemeColor CGColor],
                                                                                                                                                           (id)[ThemeColor CGColor]] withColorLocationArr:@[@0.4, @1]];
            [self.scrollView addSubview:self.processView];
            self.processView.percent = [[dic objectForKey:@"completeRateValue"] doubleValue] * 100;
            originY = originY + 20 + 2;
        }
        NSString *commentStr = [dic objectForKey:@"stepComment"];
        if (commentStr.length > 0) {
            NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:commentStr];
            NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
            [paragraphStyle setLineSpacing:4];
            [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [commentStr length])];
            CGSize labelSize = [commentStr boundingRectWithSize:CGSizeMake(SCREEN_WIDTH_DEVICE - 33 - 8, MAX_INPUT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13.0], NSParagraphStyleAttributeName:paragraphStyle} context:nil].size;
            UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(33, titleLabel.frame.size.height + originY + 8, labelSize.width, labelSize.height)];
            contentLabel.textColor = TextColor;
            contentLabel.text = commentStr;
            contentLabel.attributedText = attributedString;
            contentLabel.numberOfLines = 0;
            contentLabel.font = [UIFont systemFontOfSize:13.0f];
            [self.scrollView addSubview:contentLabel];
            originY = contentLabel.frame.origin.y + contentLabel.frame.size.height + 20;
        }else{
            originY = originY + 63;
        }
    }
    [self.scrollView setContentSize:CGSizeMake(SCREEN_WIDTH_DEVICE, originY + 20)];
}
@end
