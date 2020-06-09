#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface BWRZQTaskFabuDetailViewController : UIViewController
@property (strong, nonatomic) NSString *taskId;
@property (nonatomic, strong) NSString *taskCategoryStr;
@property (assign, nonatomic) NSInteger pageNum;
@property (copy, nonatomic) void (^RefreshHandle)(void);
@end
NS_ASSUME_NONNULL_END
