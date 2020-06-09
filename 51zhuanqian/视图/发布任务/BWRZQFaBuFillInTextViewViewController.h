#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface BWRZQFaBuFillInTextViewViewController : UIViewController
@property (strong, nonatomic) NSString *titleStr;
@property (strong, nonatomic) NSString *placeholderStr;
@property (strong, nonatomic) NSString *contentStr;
@property (copy, nonatomic) void (^RefreshHandle)(NSString *__nullable content);
@end
NS_ASSUME_NONNULL_END
