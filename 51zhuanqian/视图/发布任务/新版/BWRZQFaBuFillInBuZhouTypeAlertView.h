#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@protocol FaBuFillInBuZhouTypeAlertViewDelegate <NSObject>
- (void)selectBuZhouType:(NSInteger)type; 
@end
@interface BWRZQFaBuFillInBuZhouTypeAlertView : UIView
- (id)initItem;
@property (weak, nonatomic) id<FaBuFillInBuZhouTypeAlertViewDelegate> delegate;
@end
NS_ASSUME_NONNULL_END
