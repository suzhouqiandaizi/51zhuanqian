#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@interface WYZQFaBuBuZhouObject : NSObject
+(instancetype)buzhouItemDic:(NSDictionary *)dic;
@property (assign, nonatomic) NSInteger index;
@property (assign, nonatomic) NSInteger type;
@property (strong, nonatomic) NSString *contentStr;
@property (strong, nonatomic) NSArray *images;
@property (strong, nonatomic) NSString *linkStr;
@property (strong, nonatomic) NSString *fuzhiStr;
@property (assign, nonatomic) BOOL isCreated;
@property (assign, nonatomic) BOOL isNeedEdit;
@property (strong, nonatomic) UILabel *yuan;
@property (strong, nonatomic) UILabel *line;
@property (strong, nonatomic) UILabel *title;
@property (strong, nonatomic) UIButton *editBtn;
@property (strong, nonatomic) UIButton *deleteBtn;
@property (strong, nonatomic) UILabel *contentLabel;
@property (strong, nonatomic) UILabel *linkLabel;
@property (strong, nonatomic) NSArray *showImages;
@end
NS_ASSUME_NONNULL_END
