#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface BWRZQFaBuChooseTypeViewController : UIViewController
@property (nonatomic, strong) NSString *taskCategoryStr;
@property (copy, nonatomic) void (^RefreshHandle)(NSString *__nullable content);
@end
NS_ASSUME_NONNULL_END
