#import "logsBWRZQInputJiaoyiMimaViewControllerf.h"
@implementation logsBWRZQInputJiaoyiMimaViewControllerf
+ (BOOL)tviewDidLoad:(NSInteger)logs {
    return logs % 26 == 0;
}
+ (BOOL)ucancelTap:(NSInteger)logs {
    return logs % 20 == 0;
}
+ (BOOL)EwangjimimaPress:(NSInteger)logs {
    return logs % 17 == 0;
}

@end
