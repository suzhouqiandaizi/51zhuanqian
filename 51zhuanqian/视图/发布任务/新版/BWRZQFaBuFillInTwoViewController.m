#import "BWRZQFaBuFillInTwoViewController.h"
#import "BWRZQUploadImageView.h"
#import "GlobalFunction.h"
#import "BWRZQFaBuFillInTextViewViewController.h"
#import "WZYPickerView.h"
#import "MBProgressHUD.h"
#import "CustomIOSAlertView.h"
#import "CustomInfoAlertView.h"
#import "BWRZQFaBuSuccessViewController.h"
#import "BWRZQFaBuFillInBuZhouTypeAlertView.h"
#import "BWRZQFaBuAddTuWenViewController.h"
#import "BWRZQFaBuAddFuZhiViewController.h"
#import "BWRZQFaBuAddWangZhiViewController.h"
#import "UILabel+YBAttributeTextTapAction.h"
#import "MIPhotoBrowser.h"
#import "BWRZQFaBuYuLanViewController.h"
#import "BWRZQFaBuChooseTypeViewController.h"
#define RENWUMIAOSU  @"请详细描述提交任务结果的要求，另可最多添加4张图片详细说明"
@interface BWRZQFaBuFillInTwoViewController ()<UploadImageViewDelegate, FaBuFillInBuZhouTypeAlertViewDelegate, MIPhotoBrowserDelegate>{
    NSMutableArray *renwuMutArr;
    NSMutableArray *buzhouMutArr;
    NSMutableArray *buzhouYuanMutArr;
    NSMutableArray *buzhouLineMutArr;
    NSMutableArray *buzhouEditBtnMutArr;
    NSMutableArray *buzhouDeleteBtnMutArr;
    NSMutableArray *renwuImageMutArr;
    NSArray        *deviceOptions;
    NSArray        *taskDurationOptions;
    NSArray        *submitDurationOptions;
    NSArray        *bidTimesPerUserOptions;
    NSArray        *approveDurationOptions;
    NSArray        *deviceOptionsDisplay;
    NSArray        *taskDurationoptionsDisplay;
    NSArray        *submitDurationOptionsDisplay;
    NSArray        *bidTimesPerUserOptionsDisplay;
    NSArray        *approveDurationOptionsDisplay;
    NSArray        *deviceoptionsValue;
    NSArray        *taskDurationoptionsValue;
    NSArray        *submitDurationOptionsValue;
    NSArray        *bidTimesPerUserOptionsValue;
    NSArray        *approveDurationOptionsValue;
    NSArray        *guzhushenheOptionsDisplay;
    NSString       *deviceStr;
    NSString       *taskDurationStr;
    NSString       *submitDurationStr;
    NSString       *bidTimesPerUserStr;
    NSString       *approveDurationStr;
    NSString       *guzhushenheStr;
}
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UILabel *topTypeLabel;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UILabel *jieshaoLabel;
@property (weak, nonatomic) IBOutlet UIView *oneView;
@property (weak, nonatomic) IBOutlet UILabel *renwuLabel;
@property (weak, nonatomic) IBOutlet UIView *twoView;
@property (weak, nonatomic) IBOutlet UIView *buzhouView;
@property (weak, nonatomic) IBOutlet UIButton *buzhoutianjiaBtn;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *danjiaTextField;
@property (weak, nonatomic) IBOutlet UITextField *cishuTextField;
@property (weak, nonatomic) IBOutlet UILabel *meirencishuLabel;
@property (weak, nonatomic) IBOutlet UILabel *shenheLabel;
@property (weak, nonatomic) IBOutlet UILabel *shenheshijianLabel;
@property (weak, nonatomic) IBOutlet UILabel *jieshushijianLabel;
@property (weak, nonatomic) IBOutlet UILabel *chixushijianLabel;
@property (weak, nonatomic) IBOutlet UIButton *danjiafuwufeiBtn;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UIButton *agreeBtn;
@property (weak, nonatomic) IBOutlet UILabel *bottomInfoLabel;
@property (weak, nonatomic) IBOutlet UILabel *shebeiLabel;
@property (weak, nonatomic) IBOutlet UIButton *yulanBtn;
@end
@implementation BWRZQFaBuFillInTwoViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"发布任务";
    [self addCustomBackBtn];
    self.topTypeLabel.text = self.taskCategoryStr;
    renwuMutArr= [NSMutableArray array];
    buzhouMutArr = [NSMutableArray array];
    buzhouYuanMutArr = [NSMutableArray array];
    buzhouLineMutArr = [NSMutableArray array];
    buzhouEditBtnMutArr = [NSMutableArray array];
    buzhouDeleteBtnMutArr = [NSMutableArray array];
    renwuImageMutArr = [NSMutableArray array];
    guzhushenheOptionsDisplay = [NSArray arrayWithObjects:@"是",@"否", nil];
    [self.scrollView setFrame:CGRectMake(0, 64 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE, SCREEN_HEIGHT_DEVICE - 64 - IS_iPhoneX_Top - 44 - 44 - IS_iPhoneX_Bottom)];
    [self.sureBtn setFrame:CGRectMake(100, SCREEN_HEIGHT_DEVICE - IS_iPhoneX_Bottom - 44, SCREEN_WIDTH_DEVICE - 100, 44)];
    [self.yulanBtn setFrame:CGRectMake(0, SCREEN_HEIGHT_DEVICE - IS_iPhoneX_Bottom - 44, 100, 44)];
    [self.bottomView setFrame:CGRectMake(0, SCREEN_HEIGHT_DEVICE - IS_iPhoneX_Bottom - 44 - 44, SCREEN_WIDTH_DEVICE, 44)];
    [self.sureBtn setBackgroundImage:getColorToImage(ThemeColor) forState:UIControlStateNormal];
    if (self.taskId.length > 0 && !self.againCreate) {
        self.title = @"修改任务";
        [self.sureBtn setTitle:@"修改任务" forState:UIControlStateNormal];
    }
    self.scrollView.alwaysBounceVertical = YES;
    self.buzhoutianjiaBtn.layer.masksToBounds = YES;
    self.buzhoutianjiaBtn.layer.cornerRadius = 5.0f;
    [self.buzhoutianjiaBtn setBackgroundImage:getColorToImage(RGB(255, 236, 241)) forState:UIControlStateNormal];
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(renwuTapAction:)];
    self.renwuLabel.userInteractionEnabled = YES;
    [self.renwuLabel addGestureRecognizer:tap1];
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(jieshaoTapAction:)];
    self.jieshaoLabel.userInteractionEnabled = YES;
    [self.jieshaoLabel addGestureRecognizer:tap2];
    [self requestContent:YES];
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:self.bottomInfoLabel.text];
    [text addAttribute:NSForegroundColorAttributeName value:ThemeColor range:[self.bottomInfoLabel.text rangeOfString:@"《线上任务发布协议》"]];
    self.bottomInfoLabel.attributedText = text;
    [self.bottomInfoLabel yb_addAttributeTapActionWithStrings:@[@"《线上任务发布协议》"] tapClicked:^(NSString *string, NSRange range, NSInteger index) {
        BWRZQWebShowViewController *viewCon = [[BWRZQWebShowViewController alloc] initWithNibName:@"BWRZQWebShowViewController" bundle:nil];
        viewCon.urlStr = [NSString stringWithFormat:@"%@/app_51zhuanqian/fabuProtocol/index.html", HOSTURL];
        [self.navigationController pushViewController:viewCon animated:YES];
    }];
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
        if (self.taskId.length > 0) {
            self->deviceoptionsValue = [self getValueArr:[contentDic objectForKey:@"deviceTypes"]];
            self->bidTimesPerUserOptionsValue = [self getValueArr:[contentDic objectForKey:@"bidTimesPerUserOptions"]];
            self->approveDurationOptionsValue = [self getValueArr:[contentDic objectForKey:@"approveDurationOptions"]];
            self->submitDurationOptionsValue = [self getValueArr:[contentDic objectForKey:@"submitDurationOptions"]];
            self->taskDurationoptionsValue = [self getValueArr:[contentDic objectForKey:@"taskDurationOptions"]];
            [self requestDetail];
        }else{
            [self hideHudAlert];
            self.scrollView.hidden = NO;
            self->deviceStr = [self->deviceOptionsDisplay firstObject];
            self->taskDurationStr = [self->taskDurationoptionsDisplay firstObject];
            self->submitDurationStr = [self->submitDurationOptionsDisplay firstObject];
            self->bidTimesPerUserStr = [self->bidTimesPerUserOptionsDisplay firstObject];
            self->approveDurationStr = [self->approveDurationOptionsDisplay firstObject];
            self->guzhushenheStr = [self->guzhushenheOptionsDisplay firstObject];
            self.shebeiLabel.text = self->deviceStr;
            self.meirencishuLabel.text = self->bidTimesPerUserStr;
            self.shenheLabel.text = self->guzhushenheStr;
            self.shenheshijianLabel.text = self->approveDurationStr;
            self.jieshushijianLabel.text = self->submitDurationStr;
            self.chixushijianLabel.text = self->taskDurationStr;
            self.jieshaoLabel.textColor = PlaceholderColor;
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
            float originY = self.renwuLabel.frame.origin.y + self.renwuLabel.frame.size.height + 10;
            BWRZQUploadImageView *uploadEx = [[BWRZQUploadImageView alloc] initItem:CGRectMake(15, originY, 90, 90)];
            uploadEx.category = 2;
            uploadEx.delegate = self;
            uploadEx.infoLabel.text = @"要求说明图片";
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
        self.jieshaoLabel.text = [contentDic objectForKey:@"taskDescription"];
        NSArray *steps = [contentDic objectForKey:@"taskStepList"];
        NSMutableArray *stepsMutArr = [NSMutableArray array];
        for (int i = 0; i < steps.count; i++) {
            BWRZQFaBuBuZhouObject *object = [BWRZQFaBuBuZhouObject buzhouItemDic:[steps objectAtIndex:i]];
            [stepsMutArr addObject:object];
        }
        [self->buzhouMutArr addObjectsFromArray:[stepsMutArr sortedArrayUsingComparator:^NSComparisonResult(BWRZQFaBuBuZhouObject *p1, BWRZQFaBuBuZhouObject *p2){
            return [[NSNumber numberWithInteger:p1.index] compare:[NSNumber numberWithInteger:p2.index]];
        }]];
        [self showBuZhouContentView];
        self.serviceFeePercent = [NSString stringWithFormat:@"%@", [contentDic objectForKey:@"serviceFeePercent"]];
        self.titleTextField.text = [contentDic objectForKey:@"taskTitle"];
        CGSize labelSize = CGSizeZero;
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
        self.danjiaTextField.text = [NSString stringWithFormat:@"%@", [contentDic objectForKey:@"sourceAmount"]];
        self.cishuTextField.text = [NSString stringWithFormat:@"%@", [contentDic objectForKey:@"originalBidTime"]];
        self.meirencishuLabel.text = [[self->bidTimesPerUserOptions objectAtIndex:[self->bidTimesPerUserOptionsValue indexOfObject:[NSString stringWithFormat:@"%@", [contentDic objectForKey:@"bidTimesByUser"]]]] objectForKey:@"optionDisplay"];
        self->bidTimesPerUserStr = self.meirencishuLabel.text;
        if ([[contentDic objectForKey:@"approveByOwner"] boolValue]) {
            self.shenheLabel.text = @"是";
        }else{
            self.shenheLabel.text = @"否";
        }
        self.shebeiLabel.text = [[self->deviceOptions objectAtIndex:[self->deviceoptionsValue indexOfObject:[NSString stringWithFormat:@"%@", [contentDic objectForKey:@"deviceType"]]]] objectForKey:@"optionDisplay"];
        self->deviceStr = self.shebeiLabel.text;
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
- (void)jieshaoTapAction:(UIGestureRecognizer *)gesture{
    BWRZQFaBuFillInTextViewViewController *viewCon = [[BWRZQFaBuFillInTextViewViewController alloc] initWithNibName:@"BWRZQFaBuFillInTextViewViewController" bundle:nil];
    viewCon.titleStr = @"任务说明描述";
    viewCon.placeholderStr = @"请简要描述任务";
    viewCon.contentStr = self.jieshaoLabel.text;
    viewCon.RefreshHandle = ^(NSString * _Nonnull content) {
        BOOL needRefresh = NO;
        if (![content isEqualToString:self.jieshaoLabel.text]) {
            needRefresh = YES;
        }
        if (content) {
            self.jieshaoLabel.text = content;
            self.jieshaoLabel.textColor = TextColor;
        }else{
            self.jieshaoLabel.text = @"请简要描述任务";
            self.jieshaoLabel.textColor = PlaceholderColor;
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
            self.renwuLabel.text = RENWUMIAOSU;
            self.renwuLabel.textColor = PlaceholderColor;
        }
        if (needRefresh) {
            [self refreshView];
        }
    };
    [self.navigationController pushViewController:viewCon animated:YES];
}
- (void)refreshView{
    CGSize labelSize = [self getLabelSize:self.jieshaoLabel.text];
    float heightJieshao = labelSize.height;
    if (heightJieshao < 20) {
        heightJieshao = 44;
    }else{
        heightJieshao = heightJieshao + 25;
    }
    [self.jieshaoLabel setFrame:CGRectMake(15, 106, SCREEN_WIDTH_DEVICE - 15 - 8, heightJieshao)];
    float heightBuzhouView = 130;
    if (buzhouMutArr.count > 0) {
        [self showBuZhouContentView];
    }else{
        [self.buzhouView setFrame:CGRectMake(0, self.jieshaoLabel.frame.origin.y + self.jieshaoLabel.frame.size.height, SCREEN_WIDTH_DEVICE, heightBuzhouView)];
    }
    labelSize = [self getLabelSize:self.renwuLabel.text];
    [self.renwuLabel setFrame:CGRectMake(15, 31, SCREEN_WIDTH_DEVICE - 15 - 8, labelSize.height + 25)];
    float originY = self.renwuLabel.frame.origin.y + self.renwuLabel.frame.size.height + 10;
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
    BWRZQUploadImageView *uploadEx = [renwuMutArr lastObject];
    [self.oneView setFrame:CGRectMake(0, self.buzhouView.frame.origin.y + self.buzhouView.frame.size.height, SCREEN_WIDTH_DEVICE, uploadEx.frame.origin.y + uploadEx.frame.size.height + 15)];
    [self.twoView setFrame:CGRectMake(0, self.oneView.frame.origin.y + self.oneView.frame.size.height, SCREEN_WIDTH_DEVICE, self.twoView.frame.size.height)];
    [self.contentView setFrame:CGRectMake(0, self.topView.frame.size.height, SCREEN_WIDTH_DEVICE, self.twoView.frame.origin.y + self.twoView.frame.size.height)];
    [self.scrollView setContentSize:CGSizeMake(0, self.contentView.frame.origin.y + self.contentView.frame.size.height)];
}
#pragma mark ----RefundUploadImageViewDelegate
- (void)addUploadImageView:(BWRZQUploadImageView *)item{
    if (item.category == 1) {
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
- (CGSize)getBuzhouLabelSize:(NSString *)content{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:4];
    CGSize labelSize = [content boundingRectWithSize:CGSizeMake(SCREEN_WIDTH_DEVICE - 35 - 8, MAX_INPUT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0], NSParagraphStyleAttributeName:paragraphStyle} context:nil].size;
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
- (IBAction)topTypePress {
    BWRZQFaBuChooseTypeViewController *viewCon = [[BWRZQFaBuChooseTypeViewController alloc] initWithNibName:@"BWRZQFaBuChooseTypeViewController" bundle:nil];
    viewCon.taskCategoryStr = self.taskCategoryStr;
    viewCon.RefreshHandle = ^(NSString * _Nullable content) {
        self.topTypeLabel.text = content;
        self.taskCategoryStr = content;
    };
    [self.navigationController pushViewController:viewCon animated:YES];
}
- (IBAction)fuwufeiPress {
    BWRZQWebShowViewController *viewCon = [[BWRZQWebShowViewController alloc] initWithNibName:@"BWRZQWebShowViewController" bundle:nil];
    viewCon.urlStr = [NSString stringWithFormat:@"%@/app_51zhuanqian/serviceFeeDescription.html", HOSTURL];
    [self.navigationController pushViewController:viewCon animated:YES];
}
#pragma mark ---任务奖励
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
#pragma mark ---其他设置
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
- (IBAction)zhichishebeiPress {
    [WZYPickerView showPickerViewInView:self.view
    withStrings:deviceOptionsDisplay
    withOptions:@{MMbackgroundColor: [UIColor whiteColor],
                  MMtextColor: TextColor,
                  MMtoolbarColor: [UIColor whiteColor],
                  MMbuttonColor: ThemeColor,
                  MMfont: [UIFont systemFontOfSize:16],
                  MMvalueY: @5,
                  MMselectedObject:deviceStr,
                  MMtextAlignment:@1}
     completion:^(NSString *chooseString, NSInteger row, BOOL doneBool) {
         if (doneBool) {
             self->deviceStr = chooseString;
             self.shebeiLabel.text = self->deviceStr;
         }
     }];
}
- (IBAction)buzhoutianjiaPress {
    BWRZQFaBuFillInBuZhouTypeAlertView *alertView = [[BWRZQFaBuFillInBuZhouTypeAlertView alloc] initItem];
    alertView.delegate = self;
    [self.view addSubview:alertView];
}
#pragma mark ---步骤选择类型
- (void)selectBuZhouType:(NSInteger)type{
    [self createBuZhouType:type withObject:nil];
}
- (void)createBuZhouType:(NSInteger)type withObject:(BWRZQFaBuBuZhouObject *)objectEx{
    if (type == 2) {
        BWRZQFaBuAddWangZhiViewController *viewCon = [[BWRZQFaBuAddWangZhiViewController alloc] initWithNibName:@"BWRZQFaBuAddWangZhiViewController" bundle:nil];
        viewCon.object = objectEx;
        viewCon.RefreshHandle = ^(BWRZQFaBuBuZhouObject * _Nullable object) {
            if ([self->buzhouMutArr containsObject:object]) {
                [self->buzhouMutArr replaceObjectAtIndex:object.index withObject:object];
            }else{
                [self->buzhouMutArr addObject:object];
            }
            [self refreshView];
        };
        [self.navigationController pushViewController:viewCon animated:YES];
    }else if (type ==3){
        BWRZQFaBuAddFuZhiViewController *viewCon = [[BWRZQFaBuAddFuZhiViewController alloc] initWithNibName:@"BWRZQFaBuAddFuZhiViewController" bundle:nil];
        viewCon.object = objectEx;
        viewCon.RefreshHandle = ^(BWRZQFaBuBuZhouObject * _Nullable object) {
            if ([self->buzhouMutArr containsObject:object]) {
                [self->buzhouMutArr replaceObjectAtIndex:object.index withObject:object];
            }else{
                [self->buzhouMutArr addObject:object];
            }
            [self refreshView];
        };
        [self.navigationController pushViewController:viewCon animated:YES];
    }else{
        BWRZQFaBuAddTuWenViewController *viewCon = [[BWRZQFaBuAddTuWenViewController alloc] initWithNibName:@"BWRZQFaBuAddTuWenViewController" bundle:nil];
        viewCon.object = objectEx;
        viewCon.RefreshHandle = ^(BWRZQFaBuBuZhouObject * _Nullable object) {
            if ([self->buzhouMutArr containsObject:object]) {
                [self->buzhouMutArr replaceObjectAtIndex:object.index withObject:object];
            }else{
                [self->buzhouMutArr addObject:object];
            }
            [self refreshView];
        };
        [self.navigationController pushViewController:viewCon animated:YES];
    }
}
#pragma mark ---显示任务步骤
- (void)showBuZhouContentView{
    float originY = 30;
    UILabel *lastLineImage = nil;
    for (int i = 0; i < buzhouMutArr.count; i++) {
        BWRZQFaBuBuZhouObject *object = [buzhouMutArr objectAtIndex:i];
        object.index = i;
        if (!object.isCreated) {
            object.isCreated = YES;
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
            UIButton *deleteBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH_DEVICE - 8 - 44, originY, 44, 44)];
            deleteBtn.tag = i;
            [deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
            [deleteBtn setTitleColor:ThemeColor forState:UIControlStateNormal];
            deleteBtn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
            [deleteBtn addTarget:self action:@selector(deleteBuzhou:) forControlEvents:UIControlEventTouchUpInside];
            [self.buzhouView addSubview:deleteBtn];
            object.deleteBtn = deleteBtn;
            UIButton *editBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH_DEVICE - 8 - 44 - 44 - 8, originY, 44, 44)];
            editBtn.tag = i;
            [editBtn addTarget:self action:@selector(editBuzhou:) forControlEvents:UIControlEventTouchUpInside];
            [editBtn setTitle:@"编辑" forState:UIControlStateNormal];
            [editBtn setTitleColor:ThemeColor forState:UIControlStateNormal];
            editBtn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
            [self.buzhouView addSubview:editBtn];
            object.editBtn = editBtn;
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
        }else{
            [object.yuan setFrame:CGRectMake(15, originY + 22 - 5, 12, 12)];
            if (lastLineImage) {
                [lastLineImage setFrame:CGRectMake(lastLineImage.frame.origin.x, lastLineImage.frame.origin.y, 1, object.yuan.frame.origin.y - lastLineImage.frame.origin.y)];
            };
            object.title.text = [self getBuZhouStr:i];
            [object.title setFrame:CGRectMake(35, originY, 100, 44)];
            [object.deleteBtn setFrame:CGRectMake(SCREEN_WIDTH_DEVICE - 8 - 44, originY, 44, 44)];
            object.deleteBtn.tag = i;
            [object.editBtn setFrame:CGRectMake(SCREEN_WIDTH_DEVICE - 8 - 44 - 44 - 8, originY, 44, 44)];
            object.editBtn.tag = i;
            originY = originY + object.title.frame.size.height;
            object.contentLabel.text = object.contentStr;
            CGSize labelSize = [self getBuzhouLabelSize:object.contentStr];
            [object.contentLabel setFrame:CGRectMake(35, originY, labelSize.width, labelSize.height)];
            if (object.type == 1) {
                originY = originY + object.contentLabel.frame.size.height + 15;
                for (UIImageView *item in object.showImages) {
                    [item removeFromSuperview];
                }
            }else if (object.type == 2){
                originY = originY + object.contentLabel.frame.size.height + 5;
                NSString *linkStr = [NSString stringWithFormat:@"链接：%@", object.linkStr];
                CGSize labelSize = [self getBuzhouLabelSize:linkStr];
                object.linkLabel.text = linkStr;
                NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:linkStr];
                NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
                [paragraphStyle setLineSpacing:4];
                [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [linkStr length])];
                [attributedString addAttribute:NSForegroundColorAttributeName value:TextColor range:NSMakeRange(0, 3)];
                object.linkLabel.attributedText = attributedString;
                [object.linkLabel setFrame:CGRectMake(35, originY, labelSize.width, labelSize.height)];
                originY = originY + object.linkLabel.frame.size.height + 15;
                [object.line setFrame:CGRectMake(object.yuan.center.x, object.yuan.center.y, 1, originY - 15 - object.yuan.center.y)];
            }else if (object.type == 3){
                originY = originY + object.contentLabel.frame.size.height + 5;
                NSString *fuzhiStr = [NSString stringWithFormat:@"复制信息：%@", object.fuzhiStr];
                CGSize labelSize = [self getBuzhouLabelSize:fuzhiStr];
                NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:fuzhiStr];
                NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
                [paragraphStyle setLineSpacing:4];
                [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [fuzhiStr length])];
                [attributedString addAttribute:NSForegroundColorAttributeName value:TextColor range:NSMakeRange(0, 5)];
                object.linkLabel.attributedText = attributedString;
                [object.linkLabel setFrame:CGRectMake(35, originY, labelSize.width, labelSize.height)];
                originY = originY + object.linkLabel.frame.size.height + 15;
                [object.line setFrame:CGRectMake(object.yuan.center.x, object.yuan.center.y, 1, originY - 15 - object.yuan.center.y)];
            }
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
    if (buzhouMutArr.count < 5) {
        self.buzhoutianjiaBtn.hidden = NO;
        [self.buzhouView setFrame:CGRectMake(0, self.jieshaoLabel.frame.origin.y + self.jieshaoLabel.frame.size.height, SCREEN_WIDTH_DEVICE, originY + 90)];
    }else{
        self.buzhoutianjiaBtn.hidden = YES;
        [self.buzhouView setFrame:CGRectMake(0, self.jieshaoLabel.frame.origin.y + self.jieshaoLabel.frame.size.height, SCREEN_WIDTH_DEVICE, originY + 10)];
    }
}
- (void)deleteBuzhou:(id)sender{
    UIButton *btn = (UIButton *)sender;
    BWRZQFaBuBuZhouObject *object = [buzhouMutArr objectAtIndex:btn.tag];
    [object.contentLabel removeFromSuperview];
    [object.deleteBtn removeFromSuperview];
    [object.title removeFromSuperview];
    [object.editBtn removeFromSuperview];
    [object.yuan removeFromSuperview];
    [object.line removeFromSuperview];
    [object.linkLabel removeFromSuperview];
    for (UIImageView *item in object.showImages) {
        [item removeFromSuperview];
    }
    [buzhouMutArr removeObjectAtIndex:btn.tag];
    [self refreshView];
}
- (void)editBuzhou:(id)sender{
    UIButton *btn = (UIButton *)sender;
    BWRZQFaBuBuZhouObject *object = [buzhouMutArr objectAtIndex:btn.tag];
    [self createBuZhouType:object.type withObject:object];
}
#pragma mark ---发布和预览
- (IBAction)agreePress {
    self.agreeBtn.selected = !self.agreeBtn.selected;
}
- (IBAction)yulanPress {
    if (![self hasPerfectContent]) {
        return;
    }
    BWRZQFaBuYuLanViewController *viewCon = [[BWRZQFaBuYuLanViewController alloc] initWithNibName:@"BWRZQFaBuYuLanViewController" bundle:nil];
    if (self.taskId.length > 0 && !self.againCreate) {
        viewCon.isEdit = YES;
    }
    viewCon.dic = [self getParameterDic];
    viewCon.taskId = self.taskId;
    viewCon.taskCategoryStr = self.taskCategoryStr;
    viewCon.buzhouArr = buzhouMutArr;
    viewCon.renwushijian = self.jieshushijianLabel.text;
    viewCon.chixushijian = self.chixushijianLabel.text;
    viewCon.meigerencishu = self.meirencishuLabel.text;
    viewCon.RefreshHandle = ^{
        if (self.RefreshHandle) {
            self.RefreshHandle();
        }
    };
    [self.navigationController pushViewController:viewCon animated:YES];
}
- (IBAction)surePress {
    if (![self hasPerfectContent]) {
        return;
    }
    if (!self.agreeBtn.selected) {
        [self showHUDAlert:@"请同意发布协议"];
        return;
    }
    [self loadingHUDAlert:@"正在提交"];
    if (self.taskId.length > 0 && !self.againCreate) {
        [[ServiceRequest sharedService] PUTJSON:[NSString stringWithFormat:@"task/published/%@", self.taskId] parameters:[self getParameterDic] success:^(id responseObject) {
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
        [[ServiceRequest sharedService] POSTJSON:@"task" parameters:[self getParameterDic] success:^(id responseObject) {
            [self hideHudAlert];
            BWRZQFaBuSuccessViewController *viewCon = [[BWRZQFaBuSuccessViewController alloc] initWithNibName:@"BWRZQFaBuSuccessViewController" bundle:nil];
            viewCon.taskId = [responseObject objectForKey:@"taskNo"];
            viewCon.taskCategoryStr = self.taskCategoryStr;
            viewCon.againCreate = self.againCreate;
            [self.navigationController pushViewController:viewCon animated:YES];
        } failure:^(NSString *error, NSInteger code) {
            [self hideHudAlert];
            [self showHUDAlert:error];
        }];
    }
}
- (BOOL)hasPerfectContent{
    if (self.titleTextField.text.length == 0) {
        [self showHUDAlert:@"请输入任务标题"];
        return NO;
    }
    if (self.jieshaoLabel.text.length == 0 || [self.jieshaoLabel.text isEqualToString:@"请简要描述任务"]) {
        [self showHUDAlert:@"请输入任务说明"];
        return NO;
    }
    if (buzhouMutArr.count == 0) {
        [self showHUDAlert:@"请添加任务步骤描述"];
        return NO;
    }
    if (self.renwuLabel.text.length == 0 || [self.renwuLabel.text isEqualToString:RENWUMIAOSU]) {
        [self showHUDAlert:@"请输入任务要求描述"];
        return NO;
    }
    if (self.danjiaTextField.text.length == 0) {
        [self showHUDAlert:@"请输入任务奖励单价"];
        return NO;
    }
    if (self.cishuTextField.text.length == 0) {
        [self showHUDAlert:@"请输入任务奖励次数"];
        return NO;
    }
    if ([self.cishuTextField.text floatValue] == 0.0f) {
        [self showHUDAlert:@"任务奖励次数必须大于0"];
        return NO;
    }
    return YES;
}
- (NSMutableDictionary *)getParameterDic{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:self.taskCategoryStr forKey:@"taskCategory"];
    [dic setObject:self.jieshaoLabel.text forKey:@"taskDescription"];
    [dic setObject:self.titleTextField.text forKey:@"taskTitle"];
    NSMutableArray *steps = [NSMutableArray array];
    for (int i = 0; i < buzhouMutArr.count; i++) {
        BWRZQFaBuBuZhouObject *object = [buzhouMutArr objectAtIndex:i];
        NSMutableDictionary *item = [NSMutableDictionary dictionary];
        [item setObject:[NSNumber numberWithInt:i] forKey:@"sortValue"];
        if (object.type == 2){
            [item setObject:@"LINK" forKey:@"taskStepType"];
            [item setObject:[NSArray arrayWithObject:object.linkStr] forKey:@"taskLinks"];
        }else if (object.type == 3){
            [item setObject:@"INFO" forKey:@"taskStepType"];
            [item setObject:object.fuzhiStr forKey:@"taskCopyInfo"];
        }else{
            [item setObject:@"CONTENT" forKey:@"taskStepType"];
            if (object.images.count > 0) {
                [item setObject:object.images forKey:@"taskStepImages"];
            }
        }
        [item setObject:object.contentStr forKey:@"taskDescription"];
        [steps addObject:item];
    }
     [dic setObject:steps forKey:@"taskStepCreateDtos"];
    [dic setObject:self.renwuLabel.text forKey:@"taskRequirement"];
    if (renwuImageMutArr.count > 0) {
        [dic setObject:renwuImageMutArr forKey:@"taskRequirementImages"];
    }
    [dic setObject:[[deviceOptions objectAtIndex:[deviceOptionsDisplay indexOfObject:deviceStr]] objectForKey:@"optionValue"] forKey:@"deviceType"];
    [dic setObject:[NSNumber numberWithFloat:[self.danjiaTextField.text floatValue]] forKey:@"sourceAmount"];
    [dic setObject:[NSNumber numberWithInt:[self.cishuTextField.text intValue]] forKey:@"originalBidTime"];
    [dic setObject:[NSNumber numberWithInt:[[[bidTimesPerUserOptions objectAtIndex:[bidTimesPerUserOptionsDisplay indexOfObject:bidTimesPerUserStr]] objectForKey:@"optionValue"] intValue]] forKey:@"bidTimesByUser"];
    [dic setObject:[NSNumber numberWithBool:[guzhushenheStr isEqualToString:@"是"]] forKey:@"approveByOwner"];
    [dic setObject:[NSNumber numberWithInt:[[[approveDurationOptions objectAtIndex:[approveDurationOptionsDisplay indexOfObject:approveDurationStr]] objectForKey:@"optionValue"] intValue]] forKey:@"ownerApproveDurationHours"];
    [dic setObject:[NSNumber numberWithInt:[[[submitDurationOptions objectAtIndex:[submitDurationOptionsDisplay indexOfObject:submitDurationStr]] objectForKey:@"optionValue"] intValue]] forKey:@"bidSubmitDurationHours"];
    [dic setObject:[NSNumber numberWithInt:[[[taskDurationOptions objectAtIndex:[taskDurationoptionsDisplay indexOfObject:taskDurationStr]] objectForKey:@"optionValue"] intValue]] forKey:@"taskDurationHours"];
    return dic;
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
            [self->renwuImageMutArr addObject:imageUrl];
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
    BWRZQFaBuBuZhouObject *object = [buzhouMutArr objectAtIndex:imageView.tag];
    photoBrowser.imageCount = object.showImages.count;
    photoBrowser.currentImageIndex = [object.showImages indexOfObject:imageView];
    [photoBrowser show];
}
- (UIImage *)photoBrowser:(MIPhotoBrowser *)photoBrowser placeholderImageForIndex:(NSInteger)index{
    BWRZQFaBuBuZhouObject *object = [buzhouMutArr objectAtIndex:photoBrowser.currentImgaeView.tag];
    return ((UIImageView *)[object.showImages objectAtIndex:index]).image;
}
@end
