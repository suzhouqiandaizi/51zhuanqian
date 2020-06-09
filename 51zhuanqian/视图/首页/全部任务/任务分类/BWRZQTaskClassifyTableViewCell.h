#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface BWRZQTaskClassifyTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *titleBtn;
@property (assign, nonatomic) BOOL isSelected;
@property (assign, nonatomic) NSInteger indexRow;
@property (copy, nonatomic) void (^RefreshHandle)(BWRZQTaskClassifyTableViewCell  *chooseCell);
@end
NS_ASSUME_NONNULL_END
