#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, YanzhengShoujiType) {
    YanzhengShoujiType_default = 0, 
    YanzhengShoujiType_change  = 1, 
};
NS_ASSUME_NONNULL_BEGIN
@interface WYZQYanzhengShoujiViewController : UIViewController
@property (assign, nonatomic) YanzhengShoujiType type;
@end
NS_ASSUME_NONNULL_END
