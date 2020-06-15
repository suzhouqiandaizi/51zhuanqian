#import <UIKit/UIKit.h>
@class WYZQUploadImageView;
@protocol UploadImageViewDelegate <NSObject>
@optional
- (void)addUploadImageView:(WYZQUploadImageView *_Nullable)item;
- (void)removeUploadImageView:(WYZQUploadImageView *_Nullable)item;
@end
NS_ASSUME_NONNULL_BEGIN
@interface WYZQUploadImageView : UIView
- (id)initItem:(CGRect)frame;
- (void)setHasChoose:(BOOL)choose;
- (void)showContentImageView:(NSString *)imageUrl;
@property (assign,nonatomic) BOOL hasChoose;
@property (assign,nonatomic) NSInteger category;
@property (weak, nonatomic) IBOutlet UIImageView *contentImageView;
@property (assign,nonatomic)id<UploadImageViewDelegate>delegate;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property (weak, nonatomic) IBOutlet UILabel *jiaLabel;
@property (strong, nonatomic)  NSString *imageUrl;
@end
NS_ASSUME_NONNULL_END
