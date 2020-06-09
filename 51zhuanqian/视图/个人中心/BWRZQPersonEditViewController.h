#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface BWRZQPersonEditViewController : UIViewController
@property (copy, nonatomic) NSString *nameStr;
@property (copy, nonatomic) void (^RefreshHandle)(NSString *content);
@end
NS_ASSUME_NONNULL_END
