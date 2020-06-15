#import "WYZQFaBuDetailTwoViewController.h"
#import "WYZQUploadImageView.h"
#import "GlobalFunction.h"
#import "WZYPickerView.h"
#import "MBProgressHUD.h"
#import "CustomIOSAlertView.h"
#import "CustomInfoAlertView.h"
#import "UILabel+YBAttributeTextTapAction.h"
#import "MIPhotoBrowser.h"
#import "WYZQFaBuBuZhouObject.h"
@interface WYZQFaBuDetailTwoViewController ()<MIPhotoBrowserDelegate>{
    NSArray        *buzhouArr;
    NSArray        *deviceOptions;
    NSArray        *deviceOptionsDisplay;
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
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UILabel *topTypeLabel;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UILabel *jieshaoLabel;
@property (weak, nonatomic) IBOutlet UILabel *buzhouLabel;
@property (weak, nonatomic) IBOutlet UIView *oneView;
@property (weak, nonatomic) IBOutlet UILabel *renwuLabel;
@property (weak, nonatomic) IBOutlet UIView *twoView;
@property (weak, nonatomic) IBOutlet UIView *buzhouView;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *danjiaTextField;
@property (weak, nonatomic) IBOutlet UITextField *cishuTextField;
@property (weak, nonatomic) IBOutlet UILabel *meirencishuLabel;
@property (weak, nonatomic) IBOutlet UILabel *shenheLabel;
@property (weak, nonatomic) IBOutlet UILabel *shenheshijianLabel;
@property (weak, nonatomic) IBOutlet UILabel *jieshushijianLabel;
@property (weak, nonatomic) IBOutlet UILabel *chixushijianLabel;
@property (weak, nonatomic) IBOutlet UIButton *danjiafuwufeiBtn;
@property (weak, nonatomic) IBOutlet UILabel *shebeiLabel;
@end
@implementation WYZQFaBuDetailTwoViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self addBackBtn];
    self.title = @"任务详情";
    buzhouImageMutArr = [NSMutableArray array];
    renwuImageMutArr = [NSMutableArray array];
    guzhushenheOptionsDisplay = [NSArray arrayWithObjects:@"是",@"否", nil];
    [self.scrollView setFrame:CGRectMake(0, 64 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE, SCREEN_HEIGHT_DEVICE - 64 - IS_iPhoneX_Top - IS_iPhoneX_Bottom)];
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
        [self.topView setFrame:CGRectMake(0, 0, SCREEN_WIDTH_DEVICE, 90)];
        self->deviceOptions = [contentDic objectForKey:@"deviceTypes"];
        self->deviceOptionsDisplay = [self getDisplayArr:[contentDic objectForKey:@"deviceTypes"]];
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
            self.topTypeLabel.text = [contentDic objectForKey:@"taskCategory"];
            [self.topView setFrame:CGRectMake(0, 0, SCREEN_WIDTH_DEVICE, 90)];
            NSString *jieshaoStr = [contentDic objectForKey:@"taskDescription"];
            self.jieshaoLabel.text = jieshaoStr;
            CGSize labelSize = CGSizeZero;
            labelSize = [self getLabelSize:jieshaoStr];
            float heightJieshao = labelSize.height;
            if (heightJieshao < 20) {
                heightJieshao = 44;
            }else{
                heightJieshao = heightJieshao + 25;
            }
            [self.jieshaoLabel setFrame:CGRectMake(15, 106, SCREEN_WIDTH_DEVICE - 15 - 8, heightJieshao)];
            NSArray *steps = [contentDic objectForKey:@"taskStepList"];
            NSMutableArray *stepsMutArr = [NSMutableArray array];
            for (int i = 0; i < steps.count; i++) {
                WYZQFaBuBuZhouObject *object = [WYZQFaBuBuZhouObject buzhouItemDic:[steps objectAtIndex:i]];
                [stepsMutArr addObject:object];
            }
            self->buzhouArr = [stepsMutArr sortedArrayUsingComparator:^NSComparisonResult(WYZQFaBuBuZhouObject *p1, WYZQFaBuBuZhouObject *p2){
                return [[NSNumber numberWithInteger:p1.index] compare:[NSNumber numberWithInteger:p2.index]];
            }];
            [self showBuZhouContentView];
            NSString *renwuStr = [contentDic objectForKey:@"taskRequirement"];
            NSMutableAttributedString *attributedString1 = [[NSMutableAttributedString alloc] initWithString:renwuStr];
            NSMutableParagraphStyle *paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
            [paragraphStyle1 setLineSpacing:4];
            [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [renwuStr length])];
            labelSize = [self getLabelSize:renwuStr];
            self.renwuLabel.text = renwuStr;
            self.renwuLabel.attributedText = attributedString1;
            [self.renwuLabel setFrame:CGRectMake(15, 31, SCREEN_WIDTH_DEVICE - 15 - 8, labelSize.height + 25)];
            float originY = self.renwuLabel.frame.origin.y + self.renwuLabel.frame.size.height + 10;
            NSArray *taskRequirementImages = [contentDic objectForKey:@"taskRequirementImages"];
            float originX = 15;
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
            self.shebeiLabel.text = [[self->deviceOptions objectAtIndex:[self->deviceOptionsDisplay indexOfObject:[NSString stringWithFormat:@"%@", [contentDic objectForKey:@"deviceType"]]]] objectForKey:@"optionDisplay"];
            self.shenheshijianLabel.text = [[self->approveDurationOptions objectAtIndex:[self->approveDurationOptionsDisplay indexOfObject:[NSString stringWithFormat:@"%@", [contentDic objectForKey:@"ownerApproveDurationHours"]]]] objectForKey:@"optionDisplay"];
            self.jieshushijianLabel.text = [[self->submitDurationOptions objectAtIndex:[self->submitDurationOptionsDisplay indexOfObject:[NSString stringWithFormat:@"%@", [contentDic objectForKey:@"bidSubmitDurationHours"]]]] objectForKey:@"optionDisplay"];
            self.chixushijianLabel.text = [[self->taskDurationOptions objectAtIndex:[self->taskDurationoptionsDisplay indexOfObject:[NSString stringWithFormat:@"%@", [contentDic objectForKey:@"taskDurationHours"]]]] objectForKey:@"optionDisplay"];
            UIImageView *uploadEx = [self->renwuImageMutArr lastObject];
            float heightEx = 0;
            if (uploadEx) {
                heightEx = uploadEx.frame.origin.y + uploadEx.frame.size.height + 15;
            }else{
                heightEx = self.renwuLabel.frame.origin.y + self.renwuLabel.frame.size.height;
            }
            [self.oneView setFrame:CGRectMake(0, self.buzhouView.frame.origin.y + self.buzhouView.frame.size.height, SCREEN_WIDTH_DEVICE, heightEx)];
            [self.twoView setFrame:CGRectMake(0, self.oneView.frame.origin.y + self.oneView.frame.size.height, SCREEN_WIDTH_DEVICE, self.twoView.frame.size.height)];
            [self.contentView setFrame:CGRectMake(0, self.topView.frame.size.height, SCREEN_WIDTH_DEVICE, self.twoView.frame.origin.y + self.twoView.frame.size.height)];
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
- (CGSize)getLabelSize:(NSString *)content{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:4];
    CGSize labelSize = [content boundingRectWithSize:CGSizeMake(SCREEN_WIDTH_DEVICE - 15 - 8, MAX_INPUT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0], NSParagraphStyleAttributeName:paragraphStyle} context:nil].size;
    return labelSize;
}
- (CGSize)getBuzhouLabelSize:(NSString *)content{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:4];
    CGSize labelSize = [content boundingRectWithSize:CGSizeMake(SCREEN_WIDTH_DEVICE - 35 - 8, MAX_INPUT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0], NSParagraphStyleAttributeName:paragraphStyle} context:nil].size;
    return labelSize;
}
- (NSArray *)getDisplayArr:(NSArray *)options{
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < options.count; i++) {
        [arr addObject:[NSString stringWithFormat:@"%@", [[options objectAtIndex:i] objectForKey:@"optionValue"]]];
    }
    return arr;
}
- (NSArray *)getValueArr:(NSArray *)options{
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < options.count; i++) {
        [arr addObject:[NSString stringWithFormat:@"%@", [[options objectAtIndex:i] objectForKey:@"optionValue"]]];
    }
    return arr;
}
#pragma mark ---显示任务步骤
- (void)showBuZhouContentView{
    float originY = 30;
    UILabel *lastLineImage = nil;
    for (int i = 0; i < buzhouArr.count; i++) {
        WYZQFaBuBuZhouObject *object = [buzhouArr objectAtIndex:i];
        UILabel *yuan = [[UILabel alloc] initWithFrame:CGRectMake(15, originY + 22 - 6, 12, 12)];
        yuan.layer.masksToBounds = YES;
        yuan.layer.cornerRadius = 6.0f;
        yuan.layer.borderWidth = 1.0f;
        yuan.layer.borderColor = ThemeColor.CGColor;
        [yuan setBackgroundColor:[UIColor whiteColor]];
        [self.buzhouView addSubview:yuan];
        object.yuan = yuan;
        if (lastLineImage) {
            [lastLineImage setFrame:CGRectMake(lastLineImage.frame.origin.x, lastLineImage.frame.origin.y, 1, yuan.frame.origin.y - lastLineImage.frame.origin.y)];
        };
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(35, originY, 100, 44)];
        title.text = [self getBuZhouStr:i];
        title.textColor = TextColor;
        title.font = [UIFont systemFontOfSize:15.0f];
        [self.buzhouView addSubview:title];
        object.title = title;
        originY = originY + title.frame.size.height;
        CGSize labelSize = [self getBuzhouLabelSize:object.contentStr];
        UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(35, originY, labelSize.width, labelSize.height)];
        contentLabel.numberOfLines = 0;
        contentLabel.font = [UIFont systemFontOfSize:14.0f];
        contentLabel.textColor = TextColor;
        NSMutableAttributedString *attributedString1 = [[NSMutableAttributedString alloc] initWithString:object.contentStr];
        NSMutableParagraphStyle *paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle1 setLineSpacing:4];
        [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [object.contentStr length])];
        contentLabel.attributedText = attributedString1;
        [self.buzhouView addSubview:contentLabel];
        object.contentLabel = contentLabel;
        if (object.type == 1) {
            originY = originY + object.contentLabel.frame.size.height + 15;
            UILabel *lineImage = [[UILabel alloc] initWithFrame:CGRectMake(object.yuan.center.x - 0.5, object.yuan.center.y, 1, originY - 15 - object.yuan.center.y)];
            [lineImage setBackgroundColor:ThemeColor];
            [self.buzhouView addSubview:lineImage];
            [self.buzhouView sendSubviewToBack:lineImage];
            object.line = lineImage;
        }else if (object.type == 2) {
            originY = originY + contentLabel.frame.size.height + 5;
            NSString *linkStr = [NSString stringWithFormat:@"链接：%@", object.linkStr];
            CGSize labelSize = [self getBuzhouLabelSize:linkStr];
            UILabel *linkLabel = [[UILabel alloc] initWithFrame:CGRectMake(35, originY, labelSize.width, labelSize.height)];
            linkLabel.numberOfLines = 0;
            linkLabel.font = [UIFont systemFontOfSize:14.0f];
            linkLabel.textColor = RGB(85, 147, 253);
            NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:linkStr];
            NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
            [paragraphStyle setLineSpacing:4];
            [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [linkStr length])];
            [attributedString addAttribute:NSForegroundColorAttributeName value:TextColor range:NSMakeRange(0, 3)];
            linkLabel.attributedText = attributedString;
            [self.buzhouView addSubview:linkLabel];
            object.linkLabel = linkLabel;
            originY = originY + linkLabel.frame.size.height + 15;
            UILabel *lineImage = [[UILabel alloc] initWithFrame:CGRectMake(yuan.center.x - 0.5, yuan.center.y, 1, originY - 15 - yuan.center.y)];
            [lineImage setBackgroundColor:ThemeColor];
            [self.buzhouView addSubview:lineImage];
            [self.buzhouView sendSubviewToBack:lineImage];
            object.line = lineImage;
        }else if (object.type == 3){
            originY = originY + contentLabel.frame.size.height + 5;
            NSString *fuzhiStr = [NSString stringWithFormat:@"复制信息：%@", object.fuzhiStr];
            CGSize labelSize = [self getBuzhouLabelSize:fuzhiStr];
            UILabel *fuzhiLabel = [[UILabel alloc] initWithFrame:CGRectMake(35, originY, labelSize.width, labelSize.height)];
            fuzhiLabel.numberOfLines = 0;
            fuzhiLabel.font = [UIFont systemFontOfSize:14.0f];
            fuzhiLabel.textColor = RGB(85, 147, 253);
            NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:fuzhiStr];
            NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
            [paragraphStyle setLineSpacing:4];
            [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [fuzhiStr length])];
            [attributedString addAttribute:NSForegroundColorAttributeName value:TextColor range:NSMakeRange(0, 5)];
            fuzhiLabel.attributedText = attributedString;
            [self.buzhouView addSubview:fuzhiLabel];
            object.linkLabel = fuzhiLabel;
            originY = originY + fuzhiLabel.frame.size.height + 15;
            UILabel *lineImage = [[UILabel alloc] initWithFrame:CGRectMake(yuan.center.x - 0.5, yuan.center.y, 1, originY - 15 - yuan.center.y)];
            [lineImage setBackgroundColor:ThemeColor];
            [self.buzhouView addSubview:lineImage];
            [self.buzhouView sendSubviewToBack:lineImage];
            object.line = lineImage;
        }
        if (object.type == 1) {
            float originImageX = 35;
            float imageWidth = 90;
            NSMutableArray *imageMutArr = [NSMutableArray array];
            for (int j = 0; j < object.images.count; j++) {
                UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(originImageX, originY, imageWidth, imageWidth)];
                imageView.tag = i;
                imageView.clipsToBounds = YES;
                [imageView setContentMode:UIViewContentModeScaleAspectFill];
                imageView.userInteractionEnabled = YES;
                [imageView sd_setImageWithURL:[NSURL URLWithString:[object.images objectAtIndex:j]] placeholderImage:PlaceholderImage];
                [self.buzhouView addSubview:imageView];
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(stepTapAction:)];
                [imageView addGestureRecognizer:tap];
                originImageX = originImageX + imageWidth + 15;
                if (SCREEN_WIDTH_DEVICE - originImageX < imageWidth + 30) {
                    originImageX = 35;
                    if (j < object.images.count - 1) {
                        originY = originY + imageWidth + 15;
                    }
                }
                [imageMutArr addObject: imageView];
            }
            object.showImages = imageMutArr;
            if (imageMutArr.count > 0) {
                originY = originY + imageWidth + 10;
            }
            [object.line setFrame:CGRectMake(object.yuan.center.x - 0.5, object.yuan.center.y, 1, originY - 10 - object.yuan.center.y)];
        }
        lastLineImage = object.line;
    }
    [self.buzhouView setFrame:CGRectMake(0, self.jieshaoLabel.frame.origin.y + self.jieshaoLabel.frame.size.height, SCREEN_WIDTH_DEVICE, originY + 10)];
}
- (NSString *)getBuZhouStr:(NSInteger)index{
    if (index == 0) {
        return @"步骤一";
    }else if (index == 1){
        return @"步骤二";
    }else if (index == 2){
        return @"步骤三";
    }else if (index == 3){
        return @"步骤四";
    }else if (index == 4){
        return @"步骤五";
    }else if (index == 5){
        return @"步骤六";
    }else if (index == 6){
        return @"步骤七";
    }
    return @"结束";
}
- (void)stepTapAction:(UIGestureRecognizer *)gesture{
    UIImageView *imageView = (UIImageView *)gesture.view;
    MIPhotoBrowser *photoBrowser = [[MIPhotoBrowser alloc] init];
    photoBrowser.delegate = self;
    photoBrowser.sourceImagesContainerView = imageView.superview;
    photoBrowser.currentImgaeView = imageView;
    WYZQFaBuBuZhouObject *object = [buzhouArr objectAtIndex:imageView.tag];
    photoBrowser.imageCount = object.showImages.count;
    photoBrowser.currentImageIndex = [object.showImages indexOfObject:imageView];
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
    if (photoBrowser.tagMut == 2) {
        UIImageView *imageView = renwuImageMutArr[index];
        return imageView.image;
    }else{
        WYZQFaBuBuZhouObject *object = [buzhouArr objectAtIndex:photoBrowser.currentImgaeView.tag];
        return ((UIImageView *)[object.showImages objectAtIndex:index]).image;
    }
}
- (IBAction)fuwufeiPress {
    WYZQWebShowViewController *viewCon = [[WYZQWebShowViewController alloc] initWithNibName:@"WYZQWebShowViewController" bundle:nil];
    viewCon.urlStr = [NSString stringWithFormat:@"%@/app_51zhuanqian/serviceFeeDescription.html", HOSTURL];
    [self.navigationController pushViewController:viewCon animated:YES];
}
@end
