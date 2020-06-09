#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, TaskFabuResultType) {
    TaskType_daishenhe        = 0, 
    TaskType_yitongguo        = 1, 
    TaskType_yijujue          = 2, 
};
NS_ASSUME_NONNULL_BEGIN
@interface BWRZQTaskFabuResultViewController : UIViewController
@property (assign, nonatomic) TaskFabuResultType type;
@property (strong, nonatomic) NSString *taskId;
@property (copy, nonatomic) void (^RefreshNum)(NSString *, NSInteger);
@property (assign, nonatomic) float viewHeight;
@end
NS_ASSUME_NONNULL_END
