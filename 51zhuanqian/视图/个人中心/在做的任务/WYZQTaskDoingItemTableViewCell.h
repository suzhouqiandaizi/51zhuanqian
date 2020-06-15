#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, TaskDoingType) {
    TaskDoingType_daitijiao        = 0, 
    TaskDoingType_daitishenhe      = 1, 
    TaskDoingType_weitongguo       = 2, 
    TaskDoingType_yihuoshang       = 3, 
    TaskDoingType_renwushibai      = 4, 
};
NS_ASSUME_NONNULL_BEGIN
@interface WYZQTaskDoingItemTableViewCell : UITableViewCell
@property (nonatomic, assign) TaskDoingType type;
- (void)showContent:(TaskDoingType)taskType withContentDic:(NSDictionary *)dic witdIndex:(NSInteger)index;
@property (copy, nonatomic) void (^chakan)(NSInteger);
@property (copy, nonatomic) void (^tijiaorenwu)(NSInteger);
@property (copy, nonatomic) void (^fangqirenwu)(NSInteger);
@end
NS_ASSUME_NONNULL_END
