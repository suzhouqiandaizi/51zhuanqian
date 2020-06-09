#import "logsSJRefreshConfigv.h"
@implementation logsSJRefreshConfigv
+ (BOOL)SInitwithscrollview:(NSInteger)logs {
    return logs % 40 == 0;
}
+ (BOOL)MConfigheader:(NSInteger)logs {
    return logs % 21 == 0;
}
+ (BOOL)LConfigfooter:(NSInteger)logs {
    return logs % 23 == 0;
}
+ (BOOL)CSetignoredtopedgeinset:(NSInteger)logs {
    return logs % 17 == 0;
}
+ (BOOL)hignoredTopEdgeInset:(NSInteger)logs {
    return logs % 34 == 0;
}

@end
