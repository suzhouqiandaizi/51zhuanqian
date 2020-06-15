#import "WYZQFaBuDetailViewController.h"
#import "GlobalFunction.h"
#import "WYZQFaBuSuccessViewController.h"
#import "MIPhotoBrowser.h"
@interface WYZQFaBuDetailViewController ()<MIPhotoBrowserDelegate>{
    NSMutableArray *buzhouImageMutArr;
    NSMutableArray *renwuImageMutArr;
    NSArray        *taskDurationOptions;
    NSArray        *submitDurationOptions;
    NSArray        *bidTimesPerUserOptions;
    NSArray        *approveDurationOptions;
    NSArray        *taskDurationoptionsDisplay;
    NSArray        *submitDurationOptionsDisplay;
    NSArray        *bidTimesPerUserOptionsDisplay;
    NSArray        *approveDurationOptionsDisplay;
    NSArray        *guzhushenheOptionsDisplay;
}
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UILabel *buzhouLabel;
@property (weak, nonatomic) IBOutlet UIView *oneView;
@property (weak, nonatomic) IBOutlet UILabel *renwuLabel;
@property (weak, nonatomic) IBOutlet UIView *twoView;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *linkTextField;
@property (weak, nonatomic) IBOutlet UITextField *danjiaTextField;
@property (weak, nonatomic) IBOutlet UITextField *cishuTextField;
@property (weak, nonatomic) IBOutlet UILabel *meirencishuLabel;
@property (weak, nonatomic) IBOutlet UILabel *shenheLabel;
@property (weak, nonatomic) IBOutlet UILabel *shenheshijianLabel;
@property (weak, nonatomic) IBOutlet UILabel *jieshushijianLabel;
@property (weak, nonatomic) IBOutlet UILabel *chixushijianLabel;
@property (weak, nonatomic) IBOutlet UIButton *danjiafuwufeiBtn;
@end
@implementation WYZQFaBuDetailViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"任务详情";
    [self addBackBtn];
    buzhouImageMutArr = [NSMutableArray array];
    renwuImageMutArr = [NSMutableArray array];
    guzhushenheOptionsDisplay = [NSArray arrayWithObjects:@"是",@"否", nil];
    [self.scrollView setFrame:CGRectMake(0, 64 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE, SCREEN_HEIGHT_DEVICE - 64 - IS_iPhoneX_Top)];
    self.scrollView.alwaysBounceVertical = YES;
    [self requestContent:YES];
}
- (void)dealloc{
    [[ServiceRequest sharedService] cancelDataTaskForKey:@"task/select-options"];
    [[ServiceRequest sharedService] cancelDataTaskForKey:[NSString stringWithFormat:@"task/published/%@", self.taskId]];
}
- (void)requestContent:(BOOL)alert{
    if (alert) {
        [self loadingHUDAlert:@"正在加载"];
    }
    self.scrollView.hidden = YES;
    [[ServiceRequest sharedService] GET:@"task/select-options" parameters:@{@"categoryName":self.taskCategoryStr} success:^(id responseObject) {
        NSDictionary *contentDic = responseObject;
        self->bidTimesPerUserOptions = [contentDic objectForKey:@"bidTimesPerUserOptions"];
        self->bidTimesPerUserOptionsDisplay = [self getDisplayArr:[contentDic objectForKey:@"bidTimesPerUserOptions"]];
        self->approveDurationOptions = [contentDic objectForKey:@"approveDurationOptions"];
        self->approveDurationOptionsDisplay = [self getDisplayArr:[contentDic objectForKey:@"approveDurationOptions"]];
        self->submitDurationOptions = [contentDic objectForKey:@"submitDurationOptions"];
        self->submitDurationOptionsDisplay = [self getDisplayArr:[contentDic objectForKey:@"submitDurationOptions"]];
        self->taskDurationOptions = [contentDic objectForKey:@"taskDurationOptions"];
        self->taskDurationoptionsDisplay = [self getDisplayArr:[contentDic objectForKey:@"taskDurationOptions"]];
        [[ServiceRequest sharedService] GET:[NSString stringWithFormat:@"task/published/%@", self.taskId] parameters:nil success:^(id responseObject) {
            [self hideHudAlert];
            self.scrollView.hidden = NO;
            NSDictionary *contentDic = responseObject;
            self.titleTextField.text = [contentDic objectForKey:@"taskTitle"];
            CGSize labelSize = CGSizeZero;
            NSString *buzhouStr = [contentDic objectForKey:@"taskSteps"];
            NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:buzhouStr];
            NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
            [paragraphStyle setLineSpacing:4];
            [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [buzhouStr length])];
            labelSize = [self getLabelSize:buzhouStr];
            self.buzhouLabel.text = buzhouStr;
            self.buzhouLabel.attributedText = attributedString;
            [self.buzhouLabel setFrame:CGRectMake(15, 106, SCREEN_WIDTH_DEVICE - 15 - 8, labelSize.height + 25)];
            float originY = self.buzhouLabel.frame.origin.y + self.buzhouLabel.frame.size.height + 10;
            float originX = 15;
            NSArray *taskStepImages = [contentDic objectForKey:@"taskStepImages"];
            for (int i = 0; i < taskStepImages.count; i++) {
                UIImageView *imageView = nil;
                if (SCREEN_WIDTH_DEVICE - originX - 10 < 90) {
                    originX = 15;
                    originY = originY + 90 + 10;
                }
                imageView = [[UIImageView alloc] initWithFrame:CGRectMake(originX, originY, 90, 90)];
                originX = originX + 90 + 10;
                imageView.clipsToBounds = YES;
                [imageView setContentMode:UIViewContentModeScaleAspectFill];
                imageView.userInteractionEnabled = YES;
                [imageView sd_setImageWithURL:[NSURL URLWithString:[taskStepImages objectAtIndex:i]] placeholderImage:PlaceholderImage];
                [self.contentView addSubview:imageView];
                [self->buzhouImageMutArr addObject:imageView];
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(stepBuZhouTapAction:)];
                [imageView addGestureRecognizer:tap];
            }
            NSString *renwuStr = [contentDic objectForKey:@"taskRequirement"];
            NSMutableAttributedString *attributedString1 = [[NSMutableAttributedString alloc] initWithString:renwuStr];
            NSMutableParagraphStyle *paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
            [paragraphStyle1 setLineSpacing:4];
            [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [renwuStr length])];
            labelSize = [self getLabelSize:renwuStr];
            self.renwuLabel.text = renwuStr;
            self.renwuLabel.attributedText = attributedString1;
            [self.renwuLabel setFrame:CGRectMake(15, 31, SCREEN_WIDTH_DEVICE - 15 - 8, labelSize.height + 25)];
            originY = self.renwuLabel.frame.origin.y + self.renwuLabel.frame.size.height + 10;
            NSArray *taskRequirementImages = [contentDic objectForKey:@"taskRequirementImages"];
            originX = 15;
            for (int i = 0; i < taskRequirementImages.count; i++) {
                UIImageView *imageView = nil;
                if (SCREEN_WIDTH_DEVICE - originX - 10 < 90) {
                    originX = 15;
                    originY = originY + 90 + 10;
                }
                imageView = [[UIImageView alloc] initWithFrame:CGRectMake(originX, originY, 90, 90)];
                originX = originX + 90 + 10;
                imageView.clipsToBounds = YES;
                [imageView setContentMode:UIViewContentModeScaleAspectFill];
                imageView.userInteractionEnabled = YES;
                [imageView sd_setImageWithURL:[NSURL URLWithString:[taskRequirementImages objectAtIndex:i]] placeholderImage:PlaceholderImage];
                [self.oneView addSubview:imageView];
                [self->renwuImageMutArr addObject:imageView];
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(stepRenWuTapAction:)];
                [imageView addGestureRecognizer:tap];
            }
            NSString *linkUrl = [[contentDic objectForKey:@"taskLinks"] firstObject];
            if (linkUrl.length > 0) {
                self.linkTextField.text = linkUrl;
            }else{
                self.linkTextField.text = @"未填写相关链接";
            }
            [self.danjiafuwufeiBtn setTitle:[NSString stringWithFormat:@"单价包含%.2f%%服务费", [[contentDic objectForKey:@"serviceFeePercent"] doubleValue] * 100] forState:UIControlStateNormal];
            [self.danjiafuwufeiBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -
             self.danjiafuwufeiBtn.imageView.frame.size.width, 0, self.danjiafuwufeiBtn.imageView.frame.size.width)];
            [self.danjiafuwufeiBtn setImageEdgeInsets:UIEdgeInsetsMake(0, self.danjiafuwufeiBtn.titleLabel.bounds.size.width, 0, - self.danjiafuwufeiBtn.titleLabel.bounds.size.width - 5)];
            self.danjiafuwufeiBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            self.danjiaTextField.text = [NSString stringWithFormat:@"%@元", [contentDic objectForKey:@"sourceAmount"]];
            self.cishuTextField.text = [NSString stringWithFormat:@"%@次", [contentDic objectForKey:@"originalBidTime"]];
            self.meirencishuLabel.text = [[self->bidTimesPerUserOptions objectAtIndex:[self->bidTimesPerUserOptionsDisplay indexOfObject:[NSString stringWithFormat:@"%@", [contentDic objectForKey:@"bidTimesByUser"]]]] objectForKey:@"optionDisplay"];
            if ([[contentDic objectForKey:@"approveByOwner"] boolValue]) {
                self.shenheLabel.text = @"是";
            }else{
                self.shenheLabel.text = @"否";
            }
            self.shenheshijianLabel.text = [[self->approveDurationOptions objectAtIndex:[self->approveDurationOptionsDisplay indexOfObject:[NSString stringWithFormat:@"%@", [contentDic objectForKey:@"ownerApproveDurationHours"]]]] objectForKey:@"optionDisplay"];
            self.jieshushijianLabel.text = [[self->submitDurationOptions objectAtIndex:[self->submitDurationOptionsDisplay indexOfObject:[NSString stringWithFormat:@"%@", [contentDic objectForKey:@"bidSubmitDurationHours"]]]] objectForKey:@"optionDisplay"];
            self.chixushijianLabel.text = [[self->taskDurationOptions objectAtIndex:[self->taskDurationoptionsDisplay indexOfObject:[NSString stringWithFormat:@"%@", [contentDic objectForKey:@"taskDurationHours"]]]] objectForKey:@"optionDisplay"];
            float originYEx = 0;
            float heightEx = 0;
            UIImageView *upload = [self->buzhouImageMutArr lastObject];
            if (upload) {
                originYEx = upload.frame.origin.y + upload.frame.size.height + 15;
            }else{
                originYEx = self.buzhouLabel.frame.origin.y + self.buzhouLabel.frame.size.height;
            }
            UIImageView *uploadEx = [self->renwuImageMutArr lastObject];
            if (uploadEx) {
                heightEx = uploadEx.frame.origin.y + uploadEx.frame.size.height + 15;
            }else{
                heightEx = self.renwuLabel.frame.origin.y + self.renwuLabel.frame.size.height;
            }
            [self.oneView setFrame:CGRectMake(0, originYEx, SCREEN_WIDTH_DEVICE, heightEx)];
            [self.twoView setFrame:CGRectMake(0, self.oneView.frame.origin.y + self.oneView.frame.size.height, SCREEN_WIDTH_DEVICE, self.twoView.frame.size.height)];
            [self.contentView setFrame:CGRectMake(0, 0, SCREEN_WIDTH_DEVICE, self.twoView.frame.origin.y + self.twoView.frame.size.height)];
            [self.scrollView setContentSize:CGSizeMake(0, self.contentView.frame.origin.y + self.contentView.frame.size.height)];
        } failure:^(NSString *error, NSInteger code) {
            [self hideHudAlert];
            [self showHUDAlert:error];
        }];
    } failure:^(NSString *error, NSInteger code) {
        [self hideHudAlert];
        [self showHUDAlert:error];
    }];
}
- (IBAction)fuwufeiPress {
    WYZQWebShowViewController *viewCon = [[WYZQWebShowViewController alloc] initWithNibName:@"WYZQWebShowViewController" bundle:nil];
    viewCon.urlStr = [NSString stringWithFormat:@"%@/app_51zhuanqian/serviceFeeDescription.html", HOSTURL];
    [self.navigationController pushViewController:viewCon animated:YES];
}
- (CGSize)getLabelSize:(NSString *)content{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:4];
    CGSize labelSize = [content boundingRectWithSize:CGSizeMake(SCREEN_WIDTH_DEVICE - 15 - 8, MAX_INPUT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0], NSParagraphStyleAttributeName:paragraphStyle} context:nil].size;
    return labelSize;
}
- (NSArray *)getDisplayArr:(NSArray *)options{
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < options.count; i++) {
        [arr addObject:[NSString stringWithFormat:@"%@", [[options objectAtIndex:i] objectForKey:@"optionValue"]]];
    }
    return arr;
}
- (void)stepBuZhouTapAction:(UIGestureRecognizer *)gesture{
    UIImageView *imageView = (UIImageView *)gesture.view;
    MIPhotoBrowser *photoBrowser = [[MIPhotoBrowser alloc] init];
    photoBrowser.delegate = self;
    photoBrowser.sourceImagesContainerView = self.contentView;
    photoBrowser.currentImgaeView = imageView;
    photoBrowser.imageCount = buzhouImageMutArr.count;
    photoBrowser.currentImageIndex = [buzhouImageMutArr indexOfObject:imageView];
    photoBrowser.tagMut = 1;
    [photoBrowser show];
}
- (void)stepRenWuTapAction:(UIGestureRecognizer *)gesture{
    UIImageView *imageView = (UIImageView *)gesture.view;
    MIPhotoBrowser *photoBrowser = [[MIPhotoBrowser alloc] init];
    photoBrowser.delegate = self;
    photoBrowser.sourceImagesContainerView = self.oneView;
    photoBrowser.currentImgaeView = imageView;
    photoBrowser.imageCount = renwuImageMutArr.count;
    photoBrowser.currentImageIndex = [renwuImageMutArr indexOfObject:imageView];
    photoBrowser.tagMut = 2;
    [photoBrowser show];
}
- (UIImage *)photoBrowser:(MIPhotoBrowser *)photoBrowser placeholderImageForIndex:(NSInteger)index{
    if (photoBrowser.tagMut == 1) {
        UIImageView *imageView = buzhouImageMutArr[index];
        return imageView.image;
    }else{
        UIImageView *imageView = renwuImageMutArr[index];
        return imageView.image;
    }
}
@end
