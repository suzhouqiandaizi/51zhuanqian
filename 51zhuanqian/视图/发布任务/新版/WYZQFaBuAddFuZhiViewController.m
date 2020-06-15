#import "WYZQFaBuAddFuZhiViewController.h"
#import "GlobalFunction.h"
@interface WYZQFaBuAddFuZhiViewController (){
    BOOL        editBool;
    BOOL        editTwoBool;
}
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;
@property (weak, nonatomic) IBOutlet UITextView *twoTextView;
@end
@implementation WYZQFaBuAddFuZhiViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"添加图文说明";
    [self addBackBtn];
    [((UIButton *)[self addRigthBtn:@"保存"]) addTarget:self action:@selector(surePress) forControlEvents:UIControlEventTouchUpInside];
    [self.sureBtn setFrame:CGRectMake(0, SCREEN_HEIGHT_DEVICE - IS_iPhoneX_Bottom - 44, SCREEN_WIDTH_DEVICE, 44)];
    [self.scrollView setFrame:CGRectMake(0, 64 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE, SCREEN_HEIGHT_DEVICE - 64 - IS_iPhoneX_Top - 44 - IS_iPhoneX_Bottom)];
    self.scrollView.alwaysBounceVertical = YES;
    [self.scrollView setContentSize:CGSizeMake(0, 400)];
    [self.sureBtn setBackgroundImage:getColorToImage(ThemeColor) forState:UIControlStateNormal];
    if (self.object) {
        self.contentTextView.textColor = TextColor;
        self.twoTextView.textColor = TextColor;
        self.contentTextView.text = self.object.contentStr;
        self.twoTextView.text = self.object.fuzhiStr;
    }else{
        self.contentTextView.textColor = PlaceholderColor;
        self.twoTextView.textColor = PlaceholderColor;
        editBool = YES;
        editTwoBool = YES;
    }
}
- (void)dealloc{
    [[ServiceRequest sharedService] cancelDataTaskForKey:@"image/base64"];
}
- (void)textViewDidBeginEditing:(UITextView *)textView{
    if (textView == self.contentTextView) {
        if (editBool) {
            editBool = NO;
            textView.text = @"";
            [textView setTextColor:TextColor];
        }
    }else if (textView == self.twoTextView){
        if (editTwoBool) {
            editTwoBool = NO;
            textView.text = @"";
            [textView setTextColor:TextColor];
        }
    }
}
- (void)textViewDidEndEditing:(UITextView *)textView{
    if (textView == self.contentTextView) {
        if (textView.text.length == 0) {
            editBool = YES;
            textView.text = @"适用于邀请码、助力链接文案等，请输入对复制信息的说明";
            [textView setTextColor:PlaceholderColor];
        }
    }else if (textView == self.twoTextView){
        if (textView.text.length == 0) {
            editTwoBool = YES;
            textView.text = @"请输入需要复制的信息";
            [textView setTextColor:PlaceholderColor];
        }
    }
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    return YES;
}
- (void)textViewDidChange:(UITextView *)textView{
    [textView setTextColor:TextColor];
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.contentTextView endEditing:YES];
    [self.twoTextView endEditing:YES];
}
- (IBAction)surePress {
    NSString *shuomingStr = @"";
    if ([self.contentTextView.text isEqualToString:@"适用于邀请码、助力链接文案等，请输入对复制信息的说明"] || self.contentTextView.text.length == 0) {
        shuomingStr = @"暂无说明";
    }else{
        shuomingStr = self.contentTextView.text;
    }
    if ([self.twoTextView.text isEqualToString:@"请输入需要复制的信息"] || self.twoTextView.text.length == 0) {
        [self showHUDAlert:@"请输入复制内容"];
        return;
    }
    if (self.object) {
        self.object.contentStr = shuomingStr;
        self.object.fuzhiStr = self.twoTextView.text;
        if (self.RefreshHandle) {
            self.RefreshHandle(self.object);
        }
    }else{
        WYZQFaBuBuZhouObject *object = [[WYZQFaBuBuZhouObject alloc] init];
        object.type = 3;
        object.contentStr = shuomingStr;
        object.fuzhiStr = self.twoTextView.text;
        if (self.RefreshHandle) {
            self.RefreshHandle(object);
        }
    }
    [self goBackAction];
}
@end
