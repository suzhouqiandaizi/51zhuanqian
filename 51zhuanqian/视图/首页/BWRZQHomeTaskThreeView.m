#import "BWRZQHomeTaskThreeView.h"
#import "AppDelegate.h"
@interface BWRZQHomeTaskThreeView(){
    NSString    *clickUrl;
}
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end
@implementation BWRZQHomeTaskThreeView
- (id)initItem:(CGRect)frame{
    self = [[[NSBundle mainBundle] loadNibNamed:@"BWRZQHomeTaskThreeView" owner:self options:nil] lastObject];
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
    BWRZQWebShowViewController *viewCon = [[BWRZQWebShowViewController alloc] initWithNibName:@"BWRZQWebShowViewController" bundle:nil];
    viewCon.urlStr = clickUrl;
    [del.navigationController pushViewController:viewCon animated:YES];
}
@end
