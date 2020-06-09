#import "BWRZQHomeTaskOneView.h"
#import "AppDelegate.h"
#import "BWRZQAllTaskViewController.h"
#import "BWRZQSingleTaskViewController.h"
@interface BWRZQHomeTaskOneView()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *difficultyLabel;
@property (weak, nonatomic) IBOutlet UILabel *profitLabel;
@property (weak, nonatomic) IBOutlet UIImageView *infoImageView;
@end
@implementation BWRZQHomeTaskOneView
- (id)initItem:(CGRect)frame{
    self = [[[NSBundle mainBundle] loadNibNamed:@"BWRZQHomeTaskOneView" owner:self options:nil] lastObject];
    if (self) {
        [self setFrame:frame];
    }
    return self;
}
- (void)showContent:(NSDictionary *)dic{
    self.titleLabel.text = [dic objectForKey:@"title"];
    self.difficultyLabel.text = [dic objectForKey:@"subTitle"];
    self.profitLabel.text = [dic objectForKey:@"description"];
    [self.infoImageView sd_setImageWithURL:[NSURL URLWithString:[dic objectForKey:@"iconUrl"]]];
}
- (IBAction)clickPress {
    AppDelegate *del = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    BWRZQSingleTaskViewController *viewCon = [[BWRZQSingleTaskViewController alloc] initWithNibName:@"BWRZQSingleTaskViewController" bundle:nil];
    viewCon.selectedStr = self.titleLabel.text;
    [del.navigationController pushViewController:viewCon animated:YES];
}
@end
