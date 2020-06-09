#import <UIKit/UIKit.h>
#import "BWRZQTaskDoingItemTableViewCell.h"
NS_ASSUME_NONNULL_BEGIN
@interface BWRZQTaskDoingDetailViewController : UIViewController
@property (strong, nonatomic) NSString *taskId;
@property (strong, nonatomic) NSString *orderId;
@property (nonatomic, assign) TaskDoingType type;
@property (copy, nonatomic) void (^RefreshHandle)(void);
@end
NS_ASSUME_NONNULL_END
