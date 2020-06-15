#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface WYZQFriendDetailViewController : UIViewController
@property (strong, nonatomic) NSString *userId;
@property (copy, nonatomic) void (^RefreshHandle)(void);
@end
NS_ASSUME_NONNULL_END
