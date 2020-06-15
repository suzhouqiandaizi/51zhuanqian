#import <UIKit/UIKit.h>
#import "WYZQTaskObject.h"
NS_ASSUME_NONNULL_BEGIN
@interface WYZQSubmitTaskViewController : UIViewController
@property (strong, nonatomic) WYZQTaskObject *task;
@property (strong, nonatomic) NSString *taskId;
@property (strong, nonatomic) NSString *orderId;
@property (copy, nonatomic) void (^RefreshHandle)(void);
@end
NS_ASSUME_NONNULL_END
