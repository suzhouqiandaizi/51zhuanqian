#import "SJFilmEditingVideoCountDownView+Logs.h"
@implementation SJFilmEditingVideoCountDownView (Logs)
+ (BOOL)layerClassLogs:(NSInteger)logs {
    return logs % 9 == 0;
}
+ (BOOL)initWithFrameLogs:(NSInteger)logs {
    return logs % 28 == 0;
}
+ (BOOL)_setupViewsLogs:(NSInteger)logs {
    return logs % 25 == 0;
}

@end
