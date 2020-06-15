#import "WYZQTaskButton.h"
#import "GlobalFunction.h"
@implementation WYZQTaskButton
- (void)drawRect:(CGRect)rect {
    [self setFrame:CGRectMake(0, SCREEN_HEIGHT_DEVICE - IS_iPhoneX_Bottom - 44, SCREEN_WIDTH_DEVICE, 44)];
}
- (void)setTaskButton:(TaskType)type{
    self.userInteractionEnabled = YES;
    switch (type) {
        case TaskType_dailingqu:
            [self setBackgroundImage:getColorToImage(ThemeColor) forState:UIControlStateNormal];
            [self setTitle:@"接受任务" forState:UIControlStateNormal];
            break;
        case TaskType_daitijiao:
            [self setBackgroundImage:getColorToImage(RGB(75, 190, 151)) forState:UIControlStateNormal];
            [self setTitle:@"提交任务结果" forState:UIControlStateNormal];
            break;
        case TaskType_shenhezhong:
            self.userInteractionEnabled = NO;
            [self setBackgroundImage:getColorToImage(RGB(183, 187, 193)) forState:UIControlStateNormal];
            [self setTitle:@"任务结果已提交，待审核" forState:UIControlStateNormal];
            break;
        case TaskType_yijiangli_no:
            self.userInteractionEnabled = NO;
            [self setBackgroundImage:getColorToImage(RGB(183, 187, 193)) forState:UIControlStateNormal];
            [self setTitle:@"任务领取次数已达上限" forState:UIControlStateNormal];
            break;
        case TaskType_yijiangli_yes:
            [self setBackgroundImage:getColorToImage(ThemeColor) forState:UIControlStateNormal];
            [self setTitle:@"接受任务" forState:UIControlStateNormal];
            break;
        default:
            [self setBackgroundImage:getColorToImage(ThemeColor) forState:UIControlStateNormal];
            [self setTitle:@"接受任务" forState:UIControlStateNormal];
            break;
    }
}
- (void)setTaskButtonTitle:(NSString *)titleStr withStatus:(NSString *)status{
    if ([status isEqualToString:@"待领取"]) {
        self.type = TaskType_dailingqu;
        [self setUserInteractionEnabled:YES];
        [self setBackgroundImage:getColorToImage(ThemeColor) forState:UIControlStateNormal];
        [self setTitle:titleStr forState:UIControlStateNormal];
    }else if ([status isEqualToString:@"待提交"]){
        self.type = TaskType_daitijiao;
        [self setUserInteractionEnabled:YES];
        [self setBackgroundImage:getColorToImage(RGB(75, 190, 151)) forState:UIControlStateNormal];
        [self setTitle:titleStr forState:UIControlStateNormal];
    }else{
        [self setUserInteractionEnabled:NO];
        [self setBackgroundImage:getColorToImage(TextGrayColor) forState:UIControlStateNormal];
        [self setTitle:titleStr forState:UIControlStateNormal];
    }
}
- (void)setTaskDoingButtonTitle:(NSString *)titleStr withStatus:(NSString *)status{
    if ([status isEqualToString:@"待领取"]) {
        self.type = TaskType_dailingqu;
        [self setUserInteractionEnabled:YES];
        [self setBackgroundImage:getColorToImage(ThemeColor) forState:UIControlStateNormal];
        [self setTitle:titleStr forState:UIControlStateNormal];
    }else if ([status isEqualToString:@"待提交"] || [status isEqualToString:@"已拒绝"]){
        self.type = TaskType_daitijiao;
        [self setUserInteractionEnabled:YES];
        [self setBackgroundImage:getColorToImage(RGB(75, 190, 151)) forState:UIControlStateNormal];
        [self setTitle:titleStr forState:UIControlStateNormal];
    }else{
        [self setUserInteractionEnabled:NO];
        [self setBackgroundImage:getColorToImage(TextGrayColor) forState:UIControlStateNormal];
        [self setTitle:titleStr forState:UIControlStateNormal];
    }
}
@end
