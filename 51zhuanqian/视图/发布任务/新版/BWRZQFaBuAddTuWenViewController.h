#import <UIKit/UIKit.h>
#import "BWRZQFaBuBuZhouObject.h"
NS_ASSUME_NONNULL_BEGIN
@interface BWRZQFaBuAddTuWenViewController : UIViewController
@property (strong, nonatomic) NSString *contentStr;
@property (strong, nonatomic) BWRZQFaBuBuZhouObject *object;
@property (copy, nonatomic) void (^RefreshHandle)(BWRZQFaBuBuZhouObject *__nullable object);
@end
NS_ASSUME_NONNULL_END
