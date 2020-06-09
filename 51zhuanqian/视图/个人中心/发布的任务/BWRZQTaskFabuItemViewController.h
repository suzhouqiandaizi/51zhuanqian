#import <UIKit/UIKit.h>
#import "BWRZQTaskFabuItemTableViewCell.h"
NS_ASSUME_NONNULL_BEGIN
@interface BWRZQTaskFabuItemViewController : UIViewController
@property (nonatomic, assign) TaskFabuType type;
@property (copy, nonatomic) void (^RefreshNum)(NSString *, NSInteger);
@end
NS_ASSUME_NONNULL_END
