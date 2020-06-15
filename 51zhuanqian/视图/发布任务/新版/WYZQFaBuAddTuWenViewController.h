#import <UIKit/UIKit.h>
#import "WYZQFaBuBuZhouObject.h"
NS_ASSUME_NONNULL_BEGIN
@interface WYZQFaBuAddTuWenViewController : UIViewController
@property (strong, nonatomic) NSString *contentStr;
@property (strong, nonatomic) WYZQFaBuBuZhouObject *object;
@property (copy, nonatomic) void (^RefreshHandle)(WYZQFaBuBuZhouObject *__nullable object);
@end
NS_ASSUME_NONNULL_END
