#import "WYZQFaBuFillInTextViewViewController.h"
@interface WYZQFaBuFillInTextViewViewController (){
    BOOL        editBool;
}
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;
@end
@implementation WYZQFaBuFillInTextViewViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.titleStr;
    [self addBackBtn];
    [((UIButton *)[self addRigthBtn:@"保存"]) addTarget:self action:@selector(finishPress) forControlEvents:UIControlEventTouchUpInside];
    [self.topView setFrame:CGRectMake(0, 64 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE, self.topView.frame.size.height)];
    if ([self.placeholderStr isEqualToString:self.contentStr]) {
        editBool = YES;
    }else{
        self.contentTextView.text = self.contentStr;
    }
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.contentTextView becomeFirstResponder];
}
- (void)cancelPress{
    [self goBackAction];
}
- (void)finishPress{
    if ([self.contentTextView.text isEqualToString:self.placeholderStr] || self.contentTextView.text.length == 0) {
        if (self.RefreshHandle) {
            self.RefreshHandle(nil);
        }
    }else{
        if (self.RefreshHandle) {
            self.RefreshHandle(self.contentTextView.text);
        }
    }
    [self goBackAction];
}
- (void)textViewDidBeginEditing:(UITextView *)textView{
    if (editBool) {
        editBool = NO;
        textView.text = @"";
        [textView setTextColor:TextColor];
    }
}
- (void)textViewDidEndEditing:(UITextView *)textView{
    if (textView.text.length == 0) {
        editBool = YES;
        textView.text = self.placeholderStr;
        [textView setTextColor:PlaceholderColor];
    }
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    return YES;
}
- (void)textViewDidChange:(UITextView *)textView{
    [textView setTextColor:TextColor];
}
@end
