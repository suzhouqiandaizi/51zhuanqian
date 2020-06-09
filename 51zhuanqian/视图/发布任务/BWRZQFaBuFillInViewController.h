#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface BWRZQFaBuFillInViewController : UIViewController
@property (nonatomic, strong) NSString *taskId;
@property (nonatomic, strong) NSString *taskCategoryStr;
@property (nonatomic, strong) NSString *serviceFeePercent;
@property (copy, nonatomic) void (^RefreshHandle)(void);
@end
NS_ASSUME_NONNULL_END
