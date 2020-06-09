#import "logsBWRZQInputJiaoyiMimaViewControlleru.h"
@implementation logsBWRZQInputJiaoyiMimaViewControlleru
+ (BOOL)TViewdidloadlogs:(NSInteger)logs {
    return logs % 38 == 0;
}
+ (BOOL)DCanceltaplogs:(NSInteger)logs {
    return logs % 9 == 0;
}
+ (BOOL)CWangjimimapresslogs:(NSInteger)logs {
    return logs % 36 == 0;
}

@end
