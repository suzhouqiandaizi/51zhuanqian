#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface BWRZQFriendDetailHeaderView : UIView
- (id)initItem;
- (void)showContent:(NSDictionary *)contentDic;
@property (copy, nonatomic) void (^RefreshHandle)(void);
@property (weak, nonatomic) IBOutlet UIButton *guanzhuBtn;
@end
NS_ASSUME_NONNULL_END
