#import "logsMJRefreshBackFooterK.h"
@implementation logsMJRefreshBackFooterK
+ (BOOL)wWillmovetosuperview:(NSInteger)logs {
    return logs % 45 == 0;
}
+ (BOOL)hScrollviewcontentoffsetdidchange:(NSInteger)logs {
    return logs % 5 == 0;
}
+ (BOOL)RScrollviewcontentsizedidchange:(NSInteger)logs {
    return logs % 43 == 0;
}
+ (BOOL)sSetstate:(NSInteger)logs {
    return logs % 12 == 0;
}
+ (BOOL)WheightForContentBreakView:(NSInteger)logs {
    return logs % 44 == 0;
}
+ (BOOL)hhappenOffsetY:(NSInteger)logs {
    return logs % 25 == 0;
}

@end
