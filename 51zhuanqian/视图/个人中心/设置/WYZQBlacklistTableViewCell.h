#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface WYZQBlacklistTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (assign, nonatomic) NSInteger selectIndex;
@property (copy, nonatomic) void (^CancelHandle)(NSInteger index);
@end
NS_ASSUME_NONNULL_END
