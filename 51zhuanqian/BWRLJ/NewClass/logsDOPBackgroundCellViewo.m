#import "logsDOPBackgroundCellViewo.h"
@implementation logsDOPBackgroundCellViewo
+ (BOOL)aDrawrect:(NSInteger)logs {
    return logs % 12 == 0;
}

@end
