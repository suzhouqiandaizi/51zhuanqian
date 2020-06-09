#import "BWRZQHomeTaskTwoView.h"
#import "BWRZQSingleTaskViewController.h"
#import "AppDelegate.h"
#import "BWRZQTaskReadHomeViewController.h"
#import "BWRZQTaskVideoPlayerHomeViewController.h"
@interface BWRZQHomeTaskTwoView(){
    NSString        *clickUrl;
    NSDictionary    *contentDic;
}
@property (weak, nonatomic) IBOutlet UIImageView *infoImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subtitleLabel;
@end
@implementation BWRZQHomeTaskTwoView
- (id)initItem:(CGRect)frame{
    self = [[[NSBundle mainBundle] loadNibNamed:@"BWRZQHomeTaskTwoView" owner:self options:nil] lastObject];
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
        BWRZQWebShowViewController *viewCon = [[BWRZQWebShowViewController alloc] initWithNibName:@"BWRZQWebShowViewController" bundle:nil];
        viewCon.urlStr = clickUrl;
        [del.navigationController pushViewController:viewCon animated:YES];
    }else{
        if ([[contentDic objectForKey:@"taskType"] isEqualToString:@"READ"]) {
            BWRZQTaskReadHomeViewController *viewCon = [[BWRZQTaskReadHomeViewController alloc] initWithNibName:@"BWRZQTaskReadHomeViewController" bundle:nil];
            viewCon.title = self.titleLabel.text;
            [del.navigationController pushViewController:viewCon animated:YES];
        }else if ([[contentDic objectForKey:@"taskType"] isEqualToString:@"VIDEO"]){
            BWRZQTaskVideoPlayerHomeViewController *viewCon = [[BWRZQTaskVideoPlayerHomeViewController alloc] initWithNibName:@"BWRZQTaskVideoPlayerHomeViewController" bundle:nil];
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
            BWRZQSingleTaskViewController *viewCon = [[BWRZQSingleTaskViewController alloc] initWithNibName:@"BWRZQSingleTaskViewController" bundle:nil];
            viewCon.titleStr = self.titleLabel.text;
            [del.navigationController pushViewController:viewCon animated:YES];
        }
    }
}
@end
