#import <UIKit/UIKit.h>
#import "WYZQTaskDoingItemTableViewCell.h"
NS_ASSUME_NONNULL_BEGIN
@interface WYZQTaskDoingItemViewController : UIViewController
@property (nonatomic, assign) TaskDoingType type;
@property (copy, nonatomic) void (^RefreshNum)(NSString *, NSInteger);
@end
NS_ASSUME_NONNULL_END
