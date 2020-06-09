#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, TaskFabuType) {
    TaskFabuType_shenhezhong        = 0, 
    TaskFabuType_daifukuan          = 1, 
    TaskFabuType_jinxingzhong       = 2, 
    TaskFabuType_dengdaijieshu      = 3, 
    TaskFabuType_yijieshu           = 4, 
    TaskFabuType_yijujue            = 5, 
};
NS_ASSUME_NONNULL_BEGIN
@interface BWRZQTaskFabuItemTableViewCell : UITableViewCell
@property (nonatomic, assign) TaskFabuType type;
- (void)showContent:(TaskFabuType)taskType withContentDic:(NSDictionary *)dic witdIndex:(NSInteger)index;
@property (copy, nonatomic) void (^chakan)(NSInteger);
@property (copy, nonatomic) void (^chakanResult)(NSInteger);
@property (copy, nonatomic) void (^fukuan)(NSInteger);
@property (copy, nonatomic) void (^xiugairenwu)(NSInteger);
@property (copy, nonatomic) void (^shanchurenwu)(NSInteger);
@property (copy, nonatomic) void (^jieshurenwu)(NSInteger);
@property (copy, nonatomic) void (^faburenwu)(NSInteger);
@end
NS_ASSUME_NONNULL_END
