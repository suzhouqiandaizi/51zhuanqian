#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface WYZQLoginPrivacyProtocolView : UIView
- (id)initItem;
@property (copy, nonatomic) void (^ClikcHandle)(NSString *url);
@end
NS_ASSUME_NONNULL_END
