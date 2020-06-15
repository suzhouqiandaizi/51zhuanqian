#import <UIKit/UIKit.h>
#import "WYZQTaskObject.h"
NS_ASSUME_NONNULL_BEGIN
@interface WYZQTaskButton : UIButton
@property (nonatomic, assign) TaskType type;
- (void)setTaskButtonTitle:(NSString *)titleStr withStatus:(NSString *)status;
- (void)setTaskDoingButtonTitle:(NSString *)titleStr withStatus:(NSString *)status;
@end
NS_ASSUME_NONNULL_END
