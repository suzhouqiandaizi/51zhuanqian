#import "WYZQHomeTaskTwoView.h"
#import "WYZQSingleTaskViewController.h"
#import "AppDelegate.h"
#import "WYZQTaskReadHomeViewController.h"
#import "WYZQTaskVideoPlayerHomeViewController.h"
@interface WYZQHomeTaskTwoView(){
    NSString        *clickUrl;
    NSDictionary    *contentDic;
}
@property (weak, nonatomic) IBOutlet UIImageView *infoImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subtitleLabel;
@end
@implementation WYZQHomeTaskTwoView
- (id)initItem:(CGRect)frame{
    self = [[[NSBundle mainBundle] loadNibNamed:@"WYZQHomeTaskTwoView" owner:self options:nil] lastObject];
    if (self) {
        [self setFrame:frame];
    }
    return self;
}
- (void)showContent:(NSDictionary *)dic{
    contentDic = dic;
    self.titleLabel.text = [dic objectForKey:@"title"];
    self.subtitleLabel.text = [dic objectForKey:@"subTitle"];
     [self.infoImageView sd_setImageWithURL:[NSURL URLWithString:[dic objectForKey:@"iconUrl"]]];
    clickUrl = [dic objectForKey:@"openUrl"];
}
- (IBAction)clickPress {
    AppDelegate *del = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    if (clickUrl.length > 0) {
        WYZQWebShowViewController *viewCon = [[WYZQWebShowViewController alloc] initWithNibName:@"WYZQWebShowViewController" bundle:nil];
        viewCon.urlStr = clickUrl;
        [del.navigationController pushViewController:viewCon animated:YES];
    }else{
        if ([[contentDic objectForKey:@"taskType"] isEqualToString:@"READ"]) {
            WYZQTaskReadHomeViewController *viewCon = [[WYZQTaskReadHomeViewController alloc] initWithNibName:@"WYZQTaskReadHomeViewController" bundle:nil];
            viewCon.title = self.titleLabel.text;
            [del.navigationController pushViewController:viewCon animated:YES];
        }else if ([[contentDic objectForKey:@"taskType"] isEqualToString:@"VIDEO"]){
            WYZQTaskVideoPlayerHomeViewController *viewCon = [[WYZQTaskVideoPlayerHomeViewController alloc] initWithNibName:@"WYZQTaskVideoPlayerHomeViewController" bundle:nil];
            viewCon.title = self.titleLabel.text;
            [del.navigationController pushViewController:viewCon animated:YES];
        }else if ([[contentDic objectForKey:@"taskType"] isEqualToString:@"91TAOJIN"]){
            if (self.thirdpartyKeyHandle) {
                self.thirdpartyKeyHandle(@"91TAOJIN");
            }
        }else if ([[contentDic objectForKey:@"taskType"] isEqualToString:@"DUOYOU"]){
            if (self.thirdpartyKeyHandle) {
                self.thirdpartyKeyHandle(@"DUOYOU");
            }
        }
        else{
            WYZQSingleTaskViewController *viewCon = [[WYZQSingleTaskViewController alloc] initWithNibName:@"WYZQSingleTaskViewController" bundle:nil];
            viewCon.titleStr = self.titleLabel.text;
            [del.navigationController pushViewController:viewCon animated:YES];
        }
    }
}
@end
