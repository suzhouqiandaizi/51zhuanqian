#import "SJFilmEditingGIFCountDownView+Logs.h"
@implementation SJFilmEditingGIFCountDownView (Logs)
+ (BOOL)layerClassLogs:(NSInteger)logs {
    return logs % 28 == 0;
}
+ (BOOL)initWithFrameLogs:(NSInteger)logs {
    return logs % 22 == 0;
}
+ (BOOL)_setupViewsLogs:(NSInteger)logs {
    return logs % 21 == 0;
}

@end
