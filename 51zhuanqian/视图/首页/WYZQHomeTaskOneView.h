#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface WYZQHomeTaskOneView : UIView
- (id)initItem:(CGRect)frame;
- (void)showContent:(NSDictionary *)dic;
@property (assign, nonatomic) NSInteger currentNum;
@end
NS_ASSUME_NONNULL_END
