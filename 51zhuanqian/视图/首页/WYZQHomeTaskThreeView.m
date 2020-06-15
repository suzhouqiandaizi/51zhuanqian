#import "WYZQHomeTaskThreeView.h"
#import "AppDelegate.h"
@interface WYZQHomeTaskThreeView(){
    NSString    *clickUrl;
}
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end
@implementation WYZQHomeTaskThreeView
- (id)initItem:(CGRect)frame{
    self = [[[NSBundle mainBundle] loadNibNamed:@"WYZQHomeTaskThreeView" owner:self options:nil] lastObject];
    if (self) {
        [self setFrame:frame];
    }
    return self;
}
- (void)showContent:(NSDictionary *)dic{
    self.titleLabel.text = [dic objectForKey:@"title"];
    clickUrl = [dic objectForKey:@"openUrl"];
}
- (IBAction)clickPress {
    AppDelegate *del = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    WYZQWebShowViewController *viewCon = [[WYZQWebShowViewController alloc] initWithNibName:@"WYZQWebShowViewController" bundle:nil];
    viewCon.urlStr = clickUrl;
    [del.navigationController pushViewController:viewCon animated:YES];
}
@end
