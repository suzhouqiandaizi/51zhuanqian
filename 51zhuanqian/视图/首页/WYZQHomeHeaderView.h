#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"
NS_ASSUME_NONNULL_BEGIN
@interface WYZQHomeHeaderView : UIView
- (id)initItem;
- (void)setBanners:(NSArray *)arr;
@property (copy, nonatomic) void (^thirdpartyKeyHandle)(NSString *key);
@property (weak, nonatomic) IBOutlet SDCycleScrollView *bannerView;
@end
NS_ASSUME_NONNULL_END
