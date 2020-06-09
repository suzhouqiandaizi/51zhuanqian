#import "SJFilmEditingBackButton+Logs.h"
@implementation SJFilmEditingBackButton (Logs)
+ (BOOL)layerClassLogs:(NSInteger)logs {
    return logs % 8 == 0;
}
+ (BOOL)initWithFrameLogs:(NSInteger)logs {
    return logs % 48 == 0;
}

@end
