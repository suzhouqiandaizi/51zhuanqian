#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, RegisterType) {
    RegisterType_default = 0, 
    RegisterType_change  = 1, 
    RegisterType_forgot  = 2, 
};
NS_ASSUME_NONNULL_BEGIN
@interface BWRZQRegisterViewController : UIViewController
@property (assign, nonatomic) RegisterType type;
@property (copy, nonatomic) void (^RefreshPhone)(NSString *phone);
@end
NS_ASSUME_NONNULL_END
