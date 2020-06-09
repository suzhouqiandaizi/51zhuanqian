#import "BWRZQFaBuFillInViewController.h"
#import "BWRZQUploadImageView.h"
#import "GlobalFunction.h"
#import "BWRZQFaBuFillInTextViewViewController.h"
#import "WZYPickerView.h"
#import "MBProgressHUD.h"
#import "CustomIOSAlertView.h"
#import "CustomInfoAlertView.h"
#import "BWRZQFaBuSuccessViewController.h"
#define BUZHOUMIAOSU @"按步骤简要描述任务目的、做法，另可最多添加4张图片详细说明\n1、\n2、\n3、"
#define RENWUMIAOSU  @"请详细描述任务要求及提交任务结果的格式，另可最多添加4张图片详细说明\n1、\n2、\n3、"
@interface BWRZQFaBuFillInViewController ()<UploadImageViewDelegate>{
    NSMutableArray *buzhouMutArr;
    NSMutableArray *renwuMutArr;
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
    NSArray        *taskDurationoptionsValue;
    NSArray        *submitDurationOptionsValue;
    NSArray        *bidTimesPerUserOptionsValue;
    NSArray        *approveDurationOptionsValue;
    NSArray        *guzhushenheOptionsDisplay;
    NSString       *taskDurationStr;
    NSString       *submitDurationStr;
    NSString       *bidTimesPerUserStr;
    NSString       *approveDurationStr;
    NSString       *guzhushenheStr;
}
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UILabel *topLabel;
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
@implementation BWRZQFaBuFillInViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"发布任务";
    [self addCustomBackBtn];
    buzhouMutArr = [NSMutableArray array];
    renwuMutArr= [NSMutableArray array];
    buzhouImageMutArr = [NSMutableArray array];
    renwuImageMutArr = [NSMutableArray array];
    guzhushenheOptionsDisplay = [NSArray arrayWithObjects:@"是",@"否", nil];
    [self.scrollView setFrame:CGRectMake(0, 64 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE, SCREEN_HEIGHT_DEVICE - 64 - IS_iPhoneX_Top - 44 - IS_iPhoneX_Bottom)];
    [self.sureBtn setFrame:CGRectMake(0, SCREEN_HEIGHT_DEVICE - IS_iPhoneX_Bottom - 44, SCREEN_WIDTH_DEVICE, 44)];
    [self.sureBtn setBackgroundImage:getColorToImage(ThemeColor) forState:UIControlStateNormal];
    if (self.taskId.length > 0) {
        [self.sureBtn setTitle:@"修改任务" forState:UIControlStateNormal];
    }
    self.scrollView.alwaysBounceVertical = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(buzhouTapAction:)];
    self.buzhouLabel.userInteractionEnabled = YES;
    [self.buzhouLabel addGestureRecognizer:tap];
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(renwuTapAction:)];
    self.renwuLabel.userInteractionEnabled = YES;
    [self.renwuLabel addGestureRecognizer:tap1];
    [self requestContent:YES];
}
- (void)addCustomBackBtn{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake(0, 0, 40, 40);
    [btn setImage:[UIImage imageNamed:@"back_btn"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(goCustomBackAction) forControlEvents:UIControlEventTouchUpInside];
    if (IOS11_OR_LATER) {
        btn.contentHorizontalAlignment =UIControlContentHorizontalAlignmentLeft;
        [btn setImageEdgeInsets:UIEdgeInsetsMake(0, -5 *SCREEN_WIDTH_DEVICE /375.0,0,0)];
    }
    UIBarButtonItem *btn_left = [[UIBarButtonItem alloc] initWithCustomView:btn];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -15;
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:negativeSpacer, btn_left, nil];
}
- (void)goCustomBackAction{
    CustomIOSAlertView *alertView = [[CustomIOSAlertView alloc] init];
    [alertView setContainerView:[[CustomInfoAlertView alloc] initItem:@"是否要放弃当前编辑？" withTitle:@"提示"]];
    [alertView setButtonTitles:[NSMutableArray arrayWithObjects:@"取消",@"放弃", nil]];
    [alertView setOnButtonTouchUpInside:^(CustomIOSAlertView *alertView, int buttonIndex) {
        [alertView close];
        if (buttonIndex == 0) {
        }else{
            [self goBackAction];
        }
    }];
    [alertView setUseMotionEffects:true];
    [self.view endEditing:YES];
    [alertView show];
}
- (void)dealloc{
    [[ServiceRequest sharedService] cancelDataTaskForKey:@"task/select-options"];
    [[ServiceRequest sharedService] cancelDataTaskForKey:@"task"];
    [[ServiceRequest sharedService] cancelDataTaskForKey:@"image/base64"];
    [[ServiceRequest sharedService] cancelDataTaskForKey:[NSString stringWithFormat:@"task/published/%@", self.taskId]];
}
- (void)requestContent:(BOOL)alert{
    if (alert) {
        [self loadingHUDAlert:@"正在加载"];
    }
    self.scrollView.hidden = YES;
    [[ServiceRequest sharedService] GET:@"task/select-options" parameters:@{@"categoryName":self.taskCategoryStr} success:^(id responseObject) {
        CGSize labelSize = CGSizeZero;
        NSDictionary *contentDic = responseObject;
        NSString *categoryDescriptionStr = [contentDic objectForKey:@"taskDescrption"];
        if (categoryDescriptionStr.length > 0) {
            labelSize = [categoryDescriptionStr boundingRectWithSize:CGSizeMake(SCREEN_WIDTH_DEVICE - 15 - 8, MAX_INPUT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13.0]} context:nil].size;
            self.topLabel.text = categoryDescriptionStr;
            [self.topLabel setFrame:CGRectMake(15, 15, labelSize.width, labelSize.height)];
            [self.topView setFrame:CGRectMake(0, 0, SCREEN_WIDTH_DEVICE, 15 + labelSize.height + 15)];
            self.topView.hidden = NO;
        }else{
            self.topView.hidden = YES;
            [self.topView setFrame:CGRectMake(0, 0, SCREEN_WIDTH_DEVICE, 0)];
        }
        self->bidTimesPerUserOptions = [contentDic objectForKey:@"bidTimesPerUserOptions"];
        self->bidTimesPerUserOptionsDisplay = [self getDisplayArr:[contentDic objectForKey:@"bidTimesPerUserOptions"]];
        self->approveDurationOptions = [contentDic objectForKey:@"approveDurationOptions"];
        self->approveDurationOptionsDisplay = [self getDisplayArr:[contentDic objectForKey:@"approveDurationOptions"]];
        self->submitDurationOptions = [contentDic objectForKey:@"submitDurationOptions"];
        self->submitDurationOptionsDisplay = [self getDisplayArr:[contentDic objectForKey:@"submitDurationOptions"]];
        self->taskDurationOptions = [contentDic objectForKey:@"taskDurationOptions"];
        self->taskDurationoptionsDisplay = [self getDisplayArr:[contentDic objectForKey:@"taskDurationOptions"]];
        if (self.taskId.length > 0) {
            self->bidTimesPerUserOptionsValue = [self getValueArr:[contentDic objectForKey:@"bidTimesPerUserOptions"]];
            self->approveDurationOptionsValue = [self getValueArr:[contentDic objectForKey:@"approveDurationOptions"]];
            self->submitDurationOptionsValue = [self getValueArr:[contentDic objectForKey:@"submitDurationOptions"]];
            self->taskDurationoptionsValue = [self getValueArr:[contentDic objectForKey:@"taskDurationOptions"]];
            [self requestDetail];
        }else{
            [self hideHudAlert];
            self.scrollView.hidden = NO;
            self->taskDurationStr = [self->taskDurationoptionsDisplay firstObject];;
            self->submitDurationStr = [self->submitDurationOptionsDisplay firstObject];;
            self->bidTimesPerUserStr = [self->bidTimesPerUserOptionsDisplay firstObject];;
            self->approveDurationStr = [self->approveDurationOptionsDisplay firstObject];;
            self->guzhushenheStr = [self->guzhushenheOptionsDisplay firstObject];
            self.meirencishuLabel.text = self->bidTimesPerUserStr;
            self.shenheLabel.text = self->guzhushenheStr;
            self.shenheshijianLabel.text = self->approveDurationStr;
            self.jieshushijianLabel.text = self->submitDurationStr;
            self.chixushijianLabel.text = self->taskDurationStr;
            NSString *buzhouStr = BUZHOUMIAOSU;
            NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:buzhouStr];
            NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
            [paragraphStyle setLineSpacing:4];
            [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [buzhouStr length])];
            self.buzhouLabel.textColor = PlaceholderColor;
            labelSize = [self getLabelSize:buzhouStr];
            self.buzhouLabel.text = buzhouStr;
            self.buzhouLabel.attributedText = attributedString;
            [self.buzhouLabel setFrame:CGRectMake(15, 106, SCREEN_WIDTH_DEVICE - 15 - 8, labelSize.height + 25)];
            float originY = self.buzhouLabel.frame.origin.y + self.buzhouLabel.frame.size.height + 10;
            BWRZQUploadImageView *upload = [[BWRZQUploadImageView alloc] initItem:CGRectMake(15, originY, 90, 90)];
            upload.category = 1;
            upload.delegate = self;
            upload.infoLabel.text = @"步骤说明图片";
            [self.contentView addSubview:upload];
            [self->buzhouMutArr addObject:upload];
            self.renwuLabel.textColor = PlaceholderColor;
            NSString *renwuStr = RENWUMIAOSU;
            NSMutableAttributedString *attributedString1 = [[NSMutableAttributedString alloc] initWithString:renwuStr];
            NSMutableParagraphStyle *paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
            [paragraphStyle1 setLineSpacing:4];
            [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [renwuStr length])];
            self.renwuLabel.textColor = PlaceholderColor;
            labelSize = [self getLabelSize:renwuStr];
            self.renwuLabel.text = renwuStr;
            self.renwuLabel.attributedText = attributedString1;
            [self.renwuLabel setFrame:CGRectMake(15, 31, SCREEN_WIDTH_DEVICE - 15 - 8, labelSize.height + 25)];
            originY = self.renwuLabel.frame.origin.y + self.renwuLabel.frame.size.height + 10;
            BWRZQUploadImageView *uploadEx = [[BWRZQUploadImageView alloc] initItem:CGRectMake(15, originY, 90, 90)];
            uploadEx.category = 2;
            uploadEx.delegate = self;
            uploadEx.infoLabel.text = @"任务说明图片";
            [self.oneView addSubview:uploadEx];
            [self->renwuMutArr addObject:uploadEx];
            [self refreshView];
        }
    } failure:^(NSString *error, NSInteger code) {
        [self hideHudAlert];
        [self showHUDAlert:error];
    }];
}
- (void)requestDetail{
    [[ServiceRequest sharedService] GET:[NSString stringWithFormat:@"task/published/%@", self.taskId] parameters:nil success:^(id responseObject) {
        [self hideHudAlert];
        self.scrollView.hidden = NO;
        NSDictionary *contentDic = responseObject;
        self.serviceFeePercent = [NSString stringWithFormat:@"%@", [contentDic objectForKey:@"serviceFeePercent"]];
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
        NSArray *taskStepImages = [contentDic objectForKey:@"taskStepImages"];
        for (int i = 0; i < taskStepImages.count; i++) {
            NSString *imageUrl = [taskStepImages objectAtIndex:i];
            BWRZQUploadImageView *upload = nil;
            if (i > 2 && SCREEN_WIDTH_DEVICE - ((90 + 10) * 3) - 30 < 90) {
                originY = originY + 90 + 10;
                upload = [[BWRZQUploadImageView alloc] initItem:CGRectMake(15 + (90 + 10) * (taskStepImages.count - 3), originY, 90, 90)];
            }else{
                upload = [[BWRZQUploadImageView alloc] initItem:CGRectMake(15 + (90 + 10) * taskStepImages.count, originY, 90, 90)];
            }
            upload.category = 1;
            upload.delegate = self;
            upload.infoLabel.text = @"步骤说明图片";
            [upload showContentImageView:imageUrl];
            [self.contentView addSubview:upload];
            [self->buzhouMutArr addObject:upload];
            [self->buzhouImageMutArr addObject:imageUrl];
        }
        if (taskStepImages.count < 4) {
            BWRZQUploadImageView *upload = [[BWRZQUploadImageView alloc] initItem:CGRectMake(15, originY, 90, 90)];
            upload.category = 1;
            upload.delegate = self;
            upload.infoLabel.text = @"步骤说明图片";
            [self.contentView addSubview:upload];
            [self->buzhouMutArr addObject:upload];
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
        for (int i = 0; i < taskRequirementImages.count; i++) {
            NSString *imageUrl = [taskRequirementImages objectAtIndex:i];
            BWRZQUploadImageView *upload = nil;
            if (i > 2 && SCREEN_WIDTH_DEVICE - ((90 + 10) * 3) - 30 < 90) {
                originY = originY + 90 + 10;
                upload = [[BWRZQUploadImageView alloc] initItem:CGRectMake(15 + (90 + 10) * (taskRequirementImages.count - 3), originY, 90, 90)];
            }else{
                upload = [[BWRZQUploadImageView alloc] initItem:CGRectMake(15 + (90 + 10) * taskRequirementImages.count, originY, 90, 90)];
            }
            upload.category = 2;
            upload.delegate = self;
            upload.infoLabel.text = @"任务说明图片";
            [upload showContentImageView:imageUrl];
            [self.oneView addSubview:upload];
            [self->renwuMutArr addObject:upload];
            [self->renwuImageMutArr addObject:imageUrl];
        }
        if (taskRequirementImages.count < 4) {
            BWRZQUploadImageView *uploadEx = [[BWRZQUploadImageView alloc] initItem:CGRectMake(15, originY, 90, 90)];
            uploadEx.category = 2;
            uploadEx.delegate = self;
            uploadEx.infoLabel.text = @"任务说明图片";
            [self.oneView addSubview:uploadEx];
            [self->renwuMutArr addObject:uploadEx];
        }
        NSString *linkUrl = [[contentDic objectForKey:@"taskLinks"] firstObject];
        if (linkUrl.length > 0) {
            self.linkTextField.text = linkUrl;
        }
        self.danjiaTextField.text = [NSString stringWithFormat:@"%@", [contentDic objectForKey:@"sourceAmount"]];
        self.cishuTextField.text = [NSString stringWithFormat:@"%@", [contentDic objectForKey:@"originalBidTime"]];
        self.meirencishuLabel.text = [[self->bidTimesPerUserOptions objectAtIndex:[self->bidTimesPerUserOptionsValue indexOfObject:[NSString stringWithFormat:@"%@", [contentDic objectForKey:@"bidTimesByUser"]]]] objectForKey:@"optionDisplay"];
        self->bidTimesPerUserStr = self.meirencishuLabel.text;
        if ([[contentDic objectForKey:@"approveByOwner"] boolValue]) {
            self.shenheLabel.text = @"是";
        }else{
            self.shenheLabel.text = @"否";
        }
        self.shenheshijianLabel.text = [[self->approveDurationOptions objectAtIndex:[self->approveDurationOptionsValue indexOfObject:[NSString stringWithFormat:@"%@", [contentDic objectForKey:@"ownerApproveDurationHours"]]]] objectForKey:@"optionDisplay"];
        self->approveDurationStr = self.shenheshijianLabel.text;
        self.jieshushijianLabel.text = [[self->submitDurationOptions objectAtIndex:[self->submitDurationOptionsValue indexOfObject:[NSString stringWithFormat:@"%@", [contentDic objectForKey:@"bidSubmitDurationHours"]]]] objectForKey:@"optionDisplay"];
        self->submitDurationStr = self.jieshushijianLabel.text;
        self.chixushijianLabel.text = [[self->taskDurationOptions objectAtIndex:[self->taskDurationoptionsValue indexOfObject:[NSString stringWithFormat:@"%@", [contentDic objectForKey:@"taskDurationHours"]]]] objectForKey:@"optionDisplay"];
        self->taskDurationStr = self.chixushijianLabel.text;
        [self refreshView];
    } failure:^(NSString *error, NSInteger code) {
        [self hideHudAlert];
        [self showHUDAlert:error];
    }];
}
- (void)buzhouTapAction:(UIGestureRecognizer *)gesture{
    BWRZQFaBuFillInTextViewViewController *viewCon = [[BWRZQFaBuFillInTextViewViewController alloc] initWithNibName:@"BWRZQFaBuFillInTextViewViewController" bundle:nil];
    viewCon.titleStr = @"任务步骤描述";
    viewCon.placeholderStr = BUZHOUMIAOSU;
    viewCon.contentStr = self.buzhouLabel.text;
    viewCon.RefreshHandle = ^(NSString * _Nonnull content) {
        BOOL needRefresh = NO;
        if (![content isEqualToString:self.buzhouLabel.text]) {
            needRefresh = YES;
        }
        if (content) {
            self.buzhouLabel.text = content;
            self.buzhouLabel.textColor = TextColor;
        }else{
            self.buzhouLabel.text = BUZHOUMIAOSU;
            self.buzhouLabel.textColor = PlaceholderColor;
        }
        if (needRefresh) {
            [self refreshView];
        }
    };
    [self.navigationController pushViewController:viewCon animated:YES];
}
- (void)renwuTapAction:(UIGestureRecognizer *)gesture{
    BWRZQFaBuFillInTextViewViewController *viewCon = [[BWRZQFaBuFillInTextViewViewController alloc] initWithNibName:@"BWRZQFaBuFillInTextViewViewController" bundle:nil];
    viewCon.titleStr = @"任务要求描述";
    viewCon.placeholderStr = RENWUMIAOSU;
    viewCon.contentStr = self.renwuLabel.text;
    viewCon.RefreshHandle = ^(NSString * _Nonnull content) {
        BOOL needRefresh = NO;
        if (![content isEqualToString:self.renwuLabel.text]) {
            needRefresh = YES;
        }
        if (content) {
            self.renwuLabel.text = content;
            self.renwuLabel.textColor = TextColor;
        }else{
            self.renwuLabel.text = BUZHOUMIAOSU;
            self.renwuLabel.textColor = PlaceholderColor;
        }
        if (needRefresh) {
            [self refreshView];
        }
    };
    [self.navigationController pushViewController:viewCon animated:YES];
}
- (void)refreshView{
    CGSize labelSize = [self getLabelSize:self.buzhouLabel.text];
    [self.buzhouLabel setFrame:CGRectMake(15, 106, SCREEN_WIDTH_DEVICE - 15 - 8, labelSize.height + 25)];
    float originY = self.buzhouLabel.frame.origin.y + self.buzhouLabel.frame.size.height + 10;
    for (int i = 0; i < buzhouMutArr.count; i++) {
        BWRZQUploadImageView *object = [buzhouMutArr objectAtIndex:i];
        if (i > 2 && SCREEN_WIDTH_DEVICE - ((90 + 10) * 3) - 30 < 90) {
            originY = originY + 90 + 10;
             [object setFrame:CGRectMake(15 + (90 + 10) * (i - 3), originY, 90, 90)];
        }else{
             [object setFrame:CGRectMake(15 + (90 + 10) * i, originY, 90, 90)];
        }
    }
    labelSize = [self getLabelSize:self.renwuLabel.text];
    [self.renwuLabel setFrame:CGRectMake(15, 31, SCREEN_WIDTH_DEVICE - 15 - 8, labelSize.height + 25)];
    originY = self.renwuLabel.frame.origin.y + self.renwuLabel.frame.size.height + 10;
    for (int i = 0; i < renwuMutArr.count; i++) {
        BWRZQUploadImageView *object = [renwuMutArr objectAtIndex:i];
        if (i > 2 && SCREEN_WIDTH_DEVICE - ((90 + 10) * 3) - 30 < 90) {
            originY = originY + 90 + 10;
             [object setFrame:CGRectMake(15 + (90 + 10) * (i - 3), originY, 90, 90)];
        }else{
             [object setFrame:CGRectMake(15 + (90 + 10) * i, originY, 90, 90)];
        }
    }
    [self.danjiafuwufeiBtn setTitle:[NSString stringWithFormat:@"单价包含%.2f%%服务费", [self.serviceFeePercent doubleValue] * 100] forState:UIControlStateNormal];
    [self.danjiafuwufeiBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -
     self.danjiafuwufeiBtn.imageView.frame.size.width, 0, self.danjiafuwufeiBtn.imageView.frame.size.width)];
    [self.danjiafuwufeiBtn setImageEdgeInsets:UIEdgeInsetsMake(0, self.danjiafuwufeiBtn.titleLabel.bounds.size.width, 0, - self.danjiafuwufeiBtn.titleLabel.bounds.size.width - 5)];
    self.danjiafuwufeiBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    BWRZQUploadImageView *upload = [buzhouMutArr lastObject];
    BWRZQUploadImageView *uploadEx = [renwuMutArr lastObject];
    [self.oneView setFrame:CGRectMake(0, upload.frame.origin.y + upload.frame.size.height + 15, SCREEN_WIDTH_DEVICE, uploadEx.frame.origin.y + uploadEx.frame.size.height + 15)];
    [self.twoView setFrame:CGRectMake(0, self.oneView.frame.origin.y + self.oneView.frame.size.height, SCREEN_WIDTH_DEVICE, self.twoView.frame.size.height)];
    [self.contentView setFrame:CGRectMake(0, self.topView.frame.size.height, SCREEN_WIDTH_DEVICE, self.twoView.frame.origin.y + self.twoView.frame.size.height)];
    [self.scrollView setContentSize:CGSizeMake(0, self.contentView.frame.origin.y + self.contentView.frame.size.height)];
}
#pragma mark ----RefundUploadImageViewDelegate
- (void)addUploadImageView:(BWRZQUploadImageView *)item{
    if (item.category == 1) {
        float originY = self.buzhouLabel.frame.origin.y + self.buzhouLabel.frame.size.height + 10;
        if (buzhouMutArr.count > 0 && buzhouMutArr.count < 4) {
            BWRZQUploadImageView *upload = nil;
            if (buzhouMutArr.count > 2 && SCREEN_WIDTH_DEVICE - ((90 + 10) * 3) - 30 < 90) {
                originY = originY + 90 + 10;
                upload = [[BWRZQUploadImageView alloc] initItem:CGRectMake(15 + (90 + 10) * (buzhouMutArr.count - 3), originY, 90, 90)];
            }else{
                upload = [[BWRZQUploadImageView alloc] initItem:CGRectMake(15 + (90 + 10) * buzhouMutArr.count, originY, 90, 90)];
            }
            upload.category = 1;
            upload.delegate = self;
            upload.infoLabel.text = @"步骤说明图片";
            [self.contentView addSubview:upload];
            [buzhouMutArr addObject:upload];
            [self refreshView];
        }
         [self pushImage:1 withImage:item];
    }else{
        float originY = self.renwuLabel.frame.origin.y + self.renwuLabel.frame.size.height + 10;
        if (renwuMutArr.count > 0 && renwuMutArr.count < 4) {
            BWRZQUploadImageView *upload = nil;
            if (renwuMutArr.count > 2 && SCREEN_WIDTH_DEVICE - ((90 + 10) * 3) - 30 < 90) {
                originY = originY + 90 + 10;
                upload = [[BWRZQUploadImageView alloc] initItem:CGRectMake(15 + (90 + 10) * (renwuMutArr.count - 3), originY, 90, 90)];
            }else{
                upload = [[BWRZQUploadImageView alloc] initItem:CGRectMake(15 + (90 + 10) * renwuMutArr.count, originY, 90, 90)];
            }
            upload.category = 2;
            upload.delegate = self;
            upload.infoLabel.text = @"任务说明图片";
            [self.oneView addSubview:upload];
            [renwuMutArr addObject:upload];
            [self refreshView];
        }
        [self pushImage:2 withImage:item];
    }
}
- (void)removeUploadImageView:(BWRZQUploadImageView *)item{
    if (item.category == 1) {
        float originY = self.buzhouLabel.frame.origin.y + self.buzhouLabel.frame.size.height + 10;
        if (buzhouMutArr.count > 0) {
            [buzhouImageMutArr removeObject:item.imageUrl];
            [buzhouMutArr removeObject:item];
            [item removeFromSuperview];
            if (buzhouMutArr.count == 3 && ((BWRZQUploadImageView *)[buzhouMutArr lastObject]).hasChoose) {
                BWRZQUploadImageView *upload = nil;
                if (buzhouMutArr.count > 2 && SCREEN_WIDTH_DEVICE - ((90 + 10) * 3) - 30 < 90) {
                    originY = originY + 90 + 10;
                    upload = [[BWRZQUploadImageView alloc] initItem:CGRectMake(15 + (90 + 10) * (buzhouMutArr.count - 3), originY, 90, 90)];
                }else{
                    upload = [[BWRZQUploadImageView alloc] initItem:CGRectMake(15 + (90 + 10) * buzhouMutArr.count, originY, 90, 90)];
                }
                upload.category = 1;
                upload.delegate = self;
                upload.infoLabel.text = @"步骤说明图片";
                [self.contentView addSubview:upload];
                [buzhouMutArr addObject:upload];
            }
            originY = self.buzhouLabel.frame.origin.y + self.buzhouLabel.frame.size.height + 10;
            for (int i = 0; i < buzhouMutArr.count; i++) {
                BWRZQUploadImageView *object = [buzhouMutArr objectAtIndex:i];
                if (i > 2 && SCREEN_WIDTH_DEVICE - ((90 + 10) * 3) - 30 < 90) {
                    originY = originY + 90 + 10;
                     [object setFrame:CGRectMake(15 + (90 + 10) * (i - 3), originY, 90, 90)];
                }else{
                     [object setFrame:CGRectMake(15 + (90 + 10) * i, originY, 90, 90)];
                }
            }
            [self refreshView];
        }
    }else{
        float originY = self.renwuLabel.frame.origin.y + self.renwuLabel.frame.size.height + 10;
        if (renwuMutArr.count > 0) {
            [renwuImageMutArr removeObject:item.imageUrl];
            [renwuMutArr removeObject:item];
            [item removeFromSuperview];
            if (renwuMutArr.count == 3 && ((BWRZQUploadImageView *)[renwuMutArr lastObject]).hasChoose) {
                BWRZQUploadImageView *upload = nil;
                if (renwuMutArr.count > 2 && SCREEN_WIDTH_DEVICE - ((90 + 10) * 3) - 30 < 90) {
                    originY = originY + 90 + 10;
                    upload = [[BWRZQUploadImageView alloc] initItem:CGRectMake(15 + (90 + 10) * (renwuMutArr.count - 3), originY, 90, 90)];
                }else{
                    upload = [[BWRZQUploadImageView alloc] initItem:CGRectMake(15 + (90 + 10) * renwuMutArr.count, originY, 90, 90)];
                }
                upload.category = 2;
                upload.delegate = self;
                upload.infoLabel.text = @"任务说明图片";
                [self.oneView addSubview:upload];
                [renwuMutArr addObject:upload];
            }
            originY = self.renwuLabel.frame.origin.y + self.renwuLabel.frame.size.height + 10;
            for (int i = 0; i < renwuMutArr.count; i++) {
                BWRZQUploadImageView *object = [renwuMutArr objectAtIndex:i];
                if (i > 2 && SCREEN_WIDTH_DEVICE - ((90 + 10) * 3) - 30 < 90) {
                    originY = originY + 90 + 10;
                     [object setFrame:CGRectMake(15 + (90 + 10) * (i - 3), originY, 90, 90)];
                }else{
                     [object setFrame:CGRectMake(15 + (90 + 10) * i, originY, 90, 90)];
                }
            }
            [self refreshView];
        }
    }
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
        [arr addObject:[NSString stringWithFormat:@"%@", [[options objectAtIndex:i] objectForKey:@"optionDisplay"]]];
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
- (IBAction)fuwufeiPress {
    BWRZQWebShowViewController *viewCon = [[BWRZQWebShowViewController alloc] initWithNibName:@"BWRZQWebShowViewController" bundle:nil];
    viewCon.urlStr = [NSString stringWithFormat:@"%@/app_51zhuanqian/serviceFeeDescription.html", HOSTURL];
    [self.navigationController pushViewController:viewCon animated:YES];
}
- (IBAction)meirenPress {
    [WZYPickerView showPickerViewInView:self.view
    withStrings:bidTimesPerUserOptionsDisplay
    withOptions:@{MMbackgroundColor: [UIColor whiteColor],
                  MMtextColor: TextColor,
                  MMtoolbarColor: [UIColor whiteColor],
                  MMbuttonColor: ThemeColor,
                  MMfont: [UIFont systemFontOfSize:16],
                  MMvalueY: @5,
                  MMselectedObject:bidTimesPerUserStr,
                  MMtextAlignment:@1}
     completion:^(NSString *chooseString, NSInteger row, BOOL doneBool) {
         if (doneBool) {
             self->bidTimesPerUserStr = chooseString;
             self.meirencishuLabel.text = self->bidTimesPerUserStr;
         }
     }];
}
- (IBAction)shenhePress {
    [WZYPickerView showPickerViewInView:self.view
    withStrings:guzhushenheOptionsDisplay
    withOptions:@{MMbackgroundColor: [UIColor whiteColor],
                  MMtextColor: TextColor,
                  MMtoolbarColor: [UIColor whiteColor],
                  MMbuttonColor: ThemeColor,
                  MMfont: [UIFont systemFontOfSize:16],
                  MMvalueY: @5,
                  MMselectedObject:guzhushenheStr,
                  MMtextAlignment:@1}
     completion:^(NSString *chooseString, NSInteger row, BOOL doneBool) {
         if (doneBool) {
             self->guzhushenheStr = chooseString;
             self.shenheLabel.text = self->guzhushenheStr;
         }
     }];
}
- (IBAction)shenheshijianPress {
    [WZYPickerView showPickerViewInView:self.view
    withStrings:approveDurationOptionsDisplay
    withOptions:@{MMbackgroundColor: [UIColor whiteColor],
                  MMtextColor: TextColor,
                  MMtoolbarColor: [UIColor whiteColor],
                  MMbuttonColor: ThemeColor,
                  MMfont: [UIFont systemFontOfSize:16],
                  MMvalueY: @5,
                  MMselectedObject:approveDurationStr,
                  MMtextAlignment:@1}
     completion:^(NSString *chooseString, NSInteger row, BOOL doneBool) {
         if (doneBool) {
             self->approveDurationStr = chooseString;
             self.shenheshijianLabel.text = self->approveDurationStr;
         }
     }];
}
- (IBAction)tijiaoshijianPress {
    [WZYPickerView showPickerViewInView:self.view
    withStrings:submitDurationOptionsDisplay
    withOptions:@{MMbackgroundColor: [UIColor whiteColor],
                  MMtextColor: TextColor,
                  MMtoolbarColor: [UIColor whiteColor],
                  MMbuttonColor: ThemeColor,
                  MMfont: [UIFont systemFontOfSize:16],
                  MMvalueY: @5,
                  MMselectedObject:submitDurationStr,
                  MMtextAlignment:@1}
     completion:^(NSString *chooseString, NSInteger row, BOOL doneBool) {
         if (doneBool) {
             self->submitDurationStr = chooseString;
             self.jieshushijianLabel.text = self->submitDurationStr;
         }
     }];
}
- (IBAction)chixutianshuPress {
    [WZYPickerView showPickerViewInView:self.view
    withStrings:taskDurationoptionsDisplay
    withOptions:@{MMbackgroundColor: [UIColor whiteColor],
                  MMtextColor: TextColor,
                  MMtoolbarColor: [UIColor whiteColor],
                  MMbuttonColor: ThemeColor,
                  MMfont: [UIFont systemFontOfSize:16],
                  MMvalueY: @5,
                  MMselectedObject:taskDurationStr,
                  MMtextAlignment:@1}
     completion:^(NSString *chooseString, NSInteger row, BOOL doneBool) {
         if (doneBool) {
             self->taskDurationStr = chooseString;
             self.chixushijianLabel.text = self->taskDurationStr;
         }
     }];
}
- (IBAction)surePress {
    if (self.titleTextField.text.length == 0) {
        [self showHUDAlert:@"请输入任务标题"];
        return;
    }
    if (self.buzhouLabel.text.length == 0 || [self.buzhouLabel.text isEqualToString:BUZHOUMIAOSU]) {
        [self showHUDAlert:@"请输入任务步骤描述"];
        return;
    }
    if (self.renwuLabel.text.length == 0 || [self.renwuLabel.text isEqualToString:RENWUMIAOSU]) {
        [self showHUDAlert:@"请输入任务要求描述"];
        return;
    }
    if (self.danjiaTextField.text.length == 0) {
        [self showHUDAlert:@"请输入任务奖励单价"];
        return;
    }
    if (self.cishuTextField.text.length == 0) {
        [self showHUDAlert:@"请输入任务奖励次数"];
        return;
    }
    if ([self.cishuTextField.text floatValue] == 0.0f) {
        [self showHUDAlert:@"任务奖励次数必须大于0"];
        return;
    }
    [self loadingHUDAlert:@"正在提交"];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:self.taskCategoryStr forKey:@"taskCategory"];
    [dic setObject:self.titleTextField.text forKey:@"taskTitle"];
    [dic setObject:self.buzhouLabel.text forKey:@"taskSteps"];
    if (buzhouImageMutArr.count > 0) {
        [dic setObject:buzhouImageMutArr forKey:@"taskStepImages"];
    }
    [dic setObject:self.renwuLabel.text forKey:@"taskRequirement"];
    if (renwuImageMutArr.count > 0) {
        [dic setObject:renwuImageMutArr forKey:@"taskRequirementImages"];
    }
    if (self.linkTextField.text.length > 0) {
        [dic setObject:[NSArray arrayWithObject:self.linkTextField.text] forKey:@"taskLinks"];
    }
    [dic setObject:[NSNumber numberWithFloat:[self.danjiaTextField.text floatValue]] forKey:@"sourceAmount"];
    [dic setObject:[NSNumber numberWithInt:[self.cishuTextField.text intValue]] forKey:@"originalBidTime"];
    [dic setObject:[NSNumber numberWithInt:[[[bidTimesPerUserOptions objectAtIndex:[bidTimesPerUserOptionsDisplay indexOfObject:bidTimesPerUserStr]] objectForKey:@"optionValue"] intValue]] forKey:@"bidTimesByUser"];
    [dic setObject:[NSNumber numberWithBool:[guzhushenheStr isEqualToString:@"是"]] forKey:@"approveByOwner"];
    [dic setObject:[NSNumber numberWithInt:[[[approveDurationOptions objectAtIndex:[approveDurationOptionsDisplay indexOfObject:approveDurationStr]] objectForKey:@"optionValue"] intValue]] forKey:@"ownerApproveDurationHours"];
    [dic setObject:[NSNumber numberWithInt:[[[submitDurationOptions objectAtIndex:[submitDurationOptionsDisplay indexOfObject:submitDurationStr]] objectForKey:@"optionValue"] intValue]] forKey:@"bidSubmitDurationHours"];
    [dic setObject:[NSNumber numberWithInt:[[[taskDurationOptions objectAtIndex:[taskDurationoptionsDisplay indexOfObject:taskDurationStr]] objectForKey:@"optionValue"] intValue]] forKey:@"taskDurationHours"];
    if (self.taskId.length > 0) {
        [[ServiceRequest sharedService] PUTJSON:[NSString stringWithFormat:@"task/published/%@", self.taskId] parameters:dic success:^(id responseObject) {
            [self hideHudAlert];
            [self showHUDAlert:@"修改成功"];
            if (self.RefreshHandle) {
                self.RefreshHandle();
            }
            [self performSelector:@selector(goBackAction) withObject:self afterDelay:2.0f];
        } failure:^(NSString *error, NSInteger code) {
            [self hideHudAlert];
            [self showHUDAlert:error];
        }];
    }else{
        [[ServiceRequest sharedService] POSTJSON:@"task" parameters:dic success:^(id responseObject) {
            [self hideHudAlert];
            BWRZQFaBuSuccessViewController *viewCon = [[BWRZQFaBuSuccessViewController alloc] initWithNibName:@"BWRZQFaBuSuccessViewController" bundle:nil];
                    viewCon.taskId = [responseObject objectForKey:@"taskNo"];
                    viewCon.taskCategoryStr = self.taskCategoryStr;
                    [self.navigationController pushViewController:viewCon animated:YES];
        } failure:^(NSString *error, NSInteger code) {
            [self hideHudAlert];
            [self showHUDAlert:error];
        }];
    }
}
#pragma mark ---上传图片 type1为任务步骤图片 2为任务要求图片
- (void)pushImage:(NSInteger)type withImage:(BWRZQUploadImageView *)item{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeAnnularDeterminate;
    hud.label.text = @"正在上传";
    __block BOOL hasAdd = NO;
    [[ServiceRequest sharedService] POSTJSON:@"image/base64" parameters:@{@"base64String":reSizeImageData(item.contentImageView.image, 0, 0)} success:^(id responseObject) {
        [hud hideAnimated:YES];
        NSString *imageUrl = [responseObject objectForKey:@"uploadFileUrl"];
        item.imageUrl = imageUrl;
        if (!hasAdd) {
            hasAdd = YES;
            if (type == 1) {
                [self->buzhouImageMutArr addObject:imageUrl];
            }else{
                [self->renwuImageMutArr addObject:imageUrl];
            }
        }
    } failure:^(NSString *error, NSInteger code) {
        [hud hideAnimated:YES];
        [self showHUDAlert:error];
    } update:^(float progress) {
        dispatch_async(dispatch_get_main_queue(), ^{
            hud.progress = progress;
        });
    }];
}
@end
