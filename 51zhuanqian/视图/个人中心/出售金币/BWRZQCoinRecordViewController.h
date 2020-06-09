#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, RecordType) {
    RecordType_coin        = 0, 
    RecordType_cash        = 1, 
};
NS_ASSUME_NONNULL_BEGIN
@interface BWRZQCoinRecordViewController : UIViewController
@property (assign, nonatomic) RecordType type;
@property (assign, nonatomic) NSInteger fenlei; 
@end
NS_ASSUME_NONNULL_END
