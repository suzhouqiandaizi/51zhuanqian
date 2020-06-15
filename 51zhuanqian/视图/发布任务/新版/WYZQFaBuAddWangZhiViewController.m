#import "WYZQFaBuAddWangZhiViewController.h"
#import "GlobalFunction.h"
@interface WYZQFaBuAddWangZhiViewController (){
    BOOL        editBool;
    BOOL        editTwoBool;
}
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;
@property (weak, nonatomic) IBOutlet UITextView *twoTextView;
@end
@implementation WYZQFaBuAddWangZhiViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"添加网址链接";
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
        self.twoTextView.text = self.object.linkStr;
    }else{
        self.contentTextView.textColor = PlaceholderColor;
        self.twoTextView.textColor = PlaceholderColor;
        editBool = YES;
        editTwoBool = YES;
    }
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
            textView.text = @"请输入打开网址的注意事项";
            [textView setTextColor:PlaceholderColor];
        }
    }else if (textView == self.twoTextView){
        if (textView.text.length == 0) {
            editTwoBool = YES;
            textView.text = @"请输入任务相关链接：https://或http://";
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
    if ([self.contentTextView.text isEqualToString:@"请输入打开网址的注意事项"] || self.contentTextView.text.length == 0) {
        shuomingStr = @"暂无说明";
    }else{
        shuomingStr = self.contentTextView.text;
    }
    if ([self.twoTextView.text isEqualToString:@"请输入任务相关链接：https://或http://"] || self.twoTextView.text.length == 0) {
        [self showHUDAlert:@"请输入链接"];
        return;
    }
    if (self.object) {
        self.object.contentStr = shuomingStr;
        self.object.linkStr = self.twoTextView.text;
        if (self.RefreshHandle) {
            self.RefreshHandle(self.object);
        }
    }else{
        WYZQFaBuBuZhouObject *object = [[WYZQFaBuBuZhouObject alloc] init];
        object.type = 2;
        object.contentStr = shuomingStr;
        object.linkStr = self.twoTextView.text;
        if (self.RefreshHandle) {
            self.RefreshHandle(object);
        }
    }
    [self goBackAction];
}
@end
