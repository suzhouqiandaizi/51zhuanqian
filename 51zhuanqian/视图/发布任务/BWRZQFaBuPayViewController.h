#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface BWRZQFaBuPayViewController : UIViewController
@property (copy, nonatomic) void (^RefreshHandle)(void);
@property (strong, nonatomic) NSString *taskId;
@property (strong, nonatomic) NSString *amountStr;
- (void)paySuccess;
@end
NS_ASSUME_NONNULL_END
