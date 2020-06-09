#import <UIKit/UIKit.h>
@class BWRZQUploadImageView;
@protocol UploadImageViewDelegate <NSObject>
@optional
- (void)addUploadImageView:(BWRZQUploadImageView *_Nullable)item;
- (void)removeUploadImageView:(BWRZQUploadImageView *_Nullable)item;
@end
NS_ASSUME_NONNULL_BEGIN
@interface BWRZQUploadImageView : UIView
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
