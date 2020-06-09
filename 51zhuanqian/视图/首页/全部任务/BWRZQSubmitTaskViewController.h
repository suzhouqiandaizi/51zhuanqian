#import <UIKit/UIKit.h>
#import "BWRZQTaskObject.h"
NS_ASSUME_NONNULL_BEGIN
@interface BWRZQSubmitTaskViewController : UIViewController
@property (strong, nonatomic) BWRZQTaskObject *task;
@property (strong, nonatomic) NSString *taskId;
@property (strong, nonatomic) NSString *orderId;
@property (copy, nonatomic) void (^RefreshHandle)(void);
@end
NS_ASSUME_NONNULL_END
