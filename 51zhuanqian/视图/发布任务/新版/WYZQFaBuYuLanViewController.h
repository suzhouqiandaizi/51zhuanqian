#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface WYZQFaBuYuLanViewController : UIViewController
@property (nonatomic, strong) NSString *taskId;
@property (nonatomic, strong) NSString *taskCategoryStr;
@property (strong, nonatomic) NSDictionary *dic;
@property (copy, nonatomic) NSArray *buzhouArr;
@property (strong, nonatomic) NSString *renwushijian;
@property (strong, nonatomic) NSString *chixushijian;
@property (strong, nonatomic) NSString *meigerencishu;
@property (assign, nonatomic) BOOL isEdit;
@property (copy, nonatomic) void (^RefreshHandle)(void);
@end
NS_ASSUME_NONNULL_END
