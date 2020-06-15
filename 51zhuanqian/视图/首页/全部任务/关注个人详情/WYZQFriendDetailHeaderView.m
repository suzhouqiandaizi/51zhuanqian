#import "WYZQFriendDetailHeaderView.h"
#import "AppDelegate.h"
#import "GlobalFunction.h"
@interface WYZQFriendDetailHeaderView(){
    NSString *targetPlatformId;
}
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *gradeImageView;
@property (weak, nonatomic) IBOutlet UILabel *guanzhuLabel;
@property (weak, nonatomic) IBOutlet UILabel *fensiLabel;
@end
@implementation WYZQFriendDetailHeaderView
- (id)initItem{
    self = [[[NSBundle mainBundle] loadNibNamed:@"WYZQFriendDetailHeaderView" owner:self options:nil] lastObject];
    if (self) {
        [self setFrame:CGRectMake(0, 0, SCREEN_WIDTH_DEVICE, 230 + IS_iPhoneX_Top)];
        addShadowToView(self.contentView, 0.3, 5.0f, 5.0f);
        self.headImageView.layer.masksToBounds = YES;
        self.headImageView.layer.cornerRadius = 30.0f;
        self.guanzhuBtn.layer.masksToBounds = YES;
        self.guanzhuBtn.layer.cornerRadius = self.guanzhuBtn.frame.size.height/2.0;
        self.guanzhuBtn.layer.borderColor = ThemeColor.CGColor;
        self.guanzhuBtn.layer.borderWidth = 0.5f;
    }
    return self;
}
- (void)showContent:(NSDictionary *)contentDic{
    targetPlatformId = [contentDic objectForKey:@"platformId"];
    NSString *nameStr = [contentDic objectForKey:@"nickName"];
    self.nameLabel.text = nameStr;
    CGSize labelSize = [nameStr boundingRectWithSize:CGSizeMake(SCREEN_WIDTH_DEVICE - 30 - 80 -140, MAX_INPUT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18.0]} context:nil].size;
    [self.nameLabel setFrame:CGRectMake(self.nameLabel.frame.origin.x, self.nameLabel.frame.origin.y, labelSize.width + 8, self.nameLabel.frame.size.height)];
    [self.gradeImageView setFrame:CGRectMake(self.nameLabel.frame.origin.x + self.nameLabel.frame.size.width, self.gradeImageView.frame.origin.y, self.gradeImageView.frame.size.width, self.gradeImageView.frame.size.height)];
    NSString *guanzhu = [NSString stringWithFormat:@"%@关注", [contentDic objectForKey:@"attentionCount"]];
    self.guanzhuLabel.text = guanzhu;
    labelSize = [guanzhu boundingRectWithSize:CGSizeMake(100, MAX_INPUT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0]} context:nil].size;
    [self.guanzhuLabel setFrame:CGRectMake(self.guanzhuLabel.frame.origin.x, self.guanzhuLabel.frame.origin.y, labelSize.width + 15, self.guanzhuLabel.frame.size.height)];
    NSString *fensi = [NSString stringWithFormat:@"%@粉丝", [contentDic objectForKey:@"fansCount"]];
    self.fensiLabel.text = fensi;
    labelSize = [fensi boundingRectWithSize:CGSizeMake(100, MAX_INPUT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0]} context:nil].size;
    [self.fensiLabel setFrame:CGRectMake(self.guanzhuLabel.frame.origin.x + self.guanzhuLabel.frame.size.width, self.guanzhuLabel.frame.origin.y, labelSize.width + 15, self.fensiLabel.frame.size.height)];
    self.guanzhuLabel = changeLabelAttribute(self.guanzhuLabel, self.guanzhuLabel.text.length - 2, 0, TextColor, [UIColor lightGrayColor], 13.0);
    self.fensiLabel = changeLabelAttribute(self.fensiLabel, self.fensiLabel.text.length - 2, 0, TextColor, [UIColor lightGrayColor], 13.0);
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:[contentDic objectForKey:@"avatar"]] placeholderImage:PlaceholderImage];
    [self.gradeImageView sd_setImageWithURL:[NSURL URLWithString:[contentDic objectForKey:@"userLevelIcon"]]];
    BOOL attentioned = [[contentDic objectForKey:@"attentioned"] boolValue];
    self.guanzhuBtn.selected = attentioned;
    if (attentioned) {
        [self.guanzhuBtn setFrame:CGRectMake(SCREEN_WIDTH_DEVICE - 30 - 8 - 70, 36, 70, 28)];
    }else{
        [self.guanzhuBtn setFrame:CGRectMake(SCREEN_WIDTH_DEVICE - 30 - 8 - 60, 36, 60, 28)];
    }
}
- (IBAction)backPress {
    AppDelegate *del = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [del.navigationController.topViewController goBackAction];
}
- (IBAction)guanzhuPress {
    AppDelegate *del = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    UserInfo *user = [UserManger currentLoggedInUser];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:user.userID forKey:@"fromPlatformId"];
    [dic setObject:targetPlatformId forKey:@"targetPlatformId"];
    if (self.guanzhuBtn.selected) {
        [del.navigationController.topViewController loadingHUDAlert:@"正在取消"];
        [[ServiceRequest sharedService] DELETE:[NSString stringWithFormat:@"user/attention/%@/%@", user.userID, targetPlatformId] parameters:dic success:^(id responseObject) {
            [del.navigationController.topViewController showHUDAlert:@"已取消"];
            [self.guanzhuBtn setFrame:CGRectMake(SCREEN_WIDTH_DEVICE - 30 - 8 - 60, 36, 60, 28)];
            self.guanzhuBtn.selected = NO;
            NSString *fensi = [self.fensiLabel.text substringToIndex:self.fensiLabel.text.length - 2];
            self.fensiLabel.text = [NSString stringWithFormat:@"%ld粉丝", [fensi integerValue] - 1];
            self.fensiLabel = changeLabelAttribute(self.fensiLabel, self.fensiLabel.text.length - 2, 0, TextColor, [UIColor lightGrayColor], 13.0);
            if (self.RefreshHandle) {
                self.RefreshHandle();
            }
        } failure:^(NSString *error, NSInteger code) {
            [del.navigationController.topViewController showHUDAlert:error];
        }];
    }else{
        [del.navigationController.topViewController loadingHUDAlert:@"正在关注"];
        [[ServiceRequest sharedService] POST:[NSString stringWithFormat:@"user/attention/%@/%@", user.userID, targetPlatformId] parameters:nil success:^(id responseObject) {
            [del.navigationController.topViewController showHUDAlert:@"已关注"];
            [self.guanzhuBtn setFrame:CGRectMake(SCREEN_WIDTH_DEVICE - 30 - 8 - 70, 36, 70, 28)];
            self.guanzhuBtn.selected = YES;
            NSString *fensi = [self.fensiLabel.text substringToIndex:self.fensiLabel.text.length - 2];
            self.fensiLabel.text = [NSString stringWithFormat:@"%ld粉丝", [fensi integerValue] + 1];
            self.fensiLabel = changeLabelAttribute(self.fensiLabel, self.fensiLabel.text.length - 2, 0, TextColor, [UIColor lightGrayColor], 13.0);
            if (self.RefreshHandle) {
                self.RefreshHandle();
            }
        } failure:^(NSString *error, NSInteger code) {
            [del.navigationController.topViewController showHUDAlert:error];
        }];
    }
}
@end
