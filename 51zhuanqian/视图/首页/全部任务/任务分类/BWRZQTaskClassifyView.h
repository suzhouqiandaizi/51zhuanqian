#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@protocol TaskClassifyViewDelegate <NSObject>
- (void)removeTaskClassifyView;
- (void)chooseTaskClassifyView:(NSArray *)leixin withSort:(NSString *)sortV withSortValue:(NSString *)sortValue;
@end
@interface BWRZQTaskClassifyView : UIView
- (id)initItem;
@property (assign, nonatomic) NSInteger type;
@property (weak, nonatomic) id<TaskClassifyViewDelegate> delegate;
- (void)showContent:(NSArray *)arr;
@end
NS_ASSUME_NONNULL_END
