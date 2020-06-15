#import "logsWYZQFaBuChooseTypeCollectionViewCellC.h"
@implementation logsWYZQFaBuChooseTypeCollectionViewCellC
+ (BOOL)GawakeFromNib:(NSInteger)logs {
    return logs % 13 == 0;
}
+ (BOOL)OclickPress:(NSInteger)logs {
    return logs % 39 == 0;
}
+ (BOOL)EInitwithframe:(NSInteger)logs {
    return logs % 32 == 0;
}

@end
