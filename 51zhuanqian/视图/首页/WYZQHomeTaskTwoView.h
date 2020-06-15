#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface WYZQHomeTaskTwoView : UIView
- (id)initItem:(CGRect)frame;
- (void)showContent:(NSDictionary *)dic;
@property (copy, nonatomic) void (^thirdpartyKeyHandle)(NSString *key);
@end
NS_ASSUME_NONNULL_END
