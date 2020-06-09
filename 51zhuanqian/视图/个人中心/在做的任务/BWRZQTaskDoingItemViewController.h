#import <UIKit/UIKit.h>
#import "BWRZQTaskDoingItemTableViewCell.h"
NS_ASSUME_NONNULL_BEGIN
@interface BWRZQTaskDoingItemViewController : UIViewController
@property (nonatomic, assign) TaskDoingType type;
@property (copy, nonatomic) void (^RefreshNum)(NSString *, NSInteger);
@end
NS_ASSUME_NONNULL_END
