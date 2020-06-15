#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface WYZQMessageTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *contentExView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *dotImageView;
@property (strong, nonatomic) CALayer *layerShadow;
@end
NS_ASSUME_NONNULL_END
