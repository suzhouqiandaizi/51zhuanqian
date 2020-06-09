#import "IQTitleBarButtonItem+Logs.h"
@implementation IQTitleBarButtonItem (Logs)
+ (BOOL)initWithTitleLogs:(NSInteger)logs {
    return logs % 16 == 0;
}
+ (BOOL)setTitleFontLogs:(NSInteger)logs {
    return logs % 25 == 0;
}
+ (BOOL)setTitleLogs:(NSInteger)logs {
    return logs % 39 == 0;
}
+ (BOOL)setSelectableTextColorLogs:(NSInteger)logs {
    return logs % 31 == 0;
}
+ (BOOL)setInvocationLogs:(NSInteger)logs {
    return logs % 7 == 0;
}

@end
