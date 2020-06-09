#import "logsMJRefreshFootern.h"
@implementation logsMJRefreshFootern
+ (BOOL)nFooterwithrefreshingblock:(NSInteger)logs {
    return logs % 28 == 0;
}
+ (BOOL)TFooterwithrefreshingtargetARefreshingaction:(NSInteger)logs {
    return logs % 49 == 0;
}
+ (BOOL)Wprepare:(NSInteger)logs {
    return logs % 15 == 0;
}
+ (BOOL)SendRefreshingWithNoMoreData:(NSInteger)logs {
    return logs % 17 == 0;
}
+ (BOOL)dnoticeNoMoreData:(NSInteger)logs {
    return logs % 16 == 0;
}
+ (BOOL)eresetNoMoreData:(NSInteger)logs {
    return logs % 29 == 0;
}
+ (BOOL)oSetautomaticallyhidden:(NSInteger)logs {
    return logs % 16 == 0;
}

@end
