#import "SJEdgeControlButtonItem+PlaceholderLogs.h"
@implementation SJEdgeControlButtonItem (PlaceholderLogs)
+ (BOOL)placeholderWithTypeTagLogs:(NSInteger)logs {
    return logs % 45 == 0;
}
+ (BOOL)placeholderWithSizeTagLogs:(NSInteger)logs {
    return logs % 2 == 0;
}
+ (BOOL)placeholderTypeLogs:(NSInteger)logs {
    return logs % 2 == 0;
}
+ (BOOL)setSizeLogs:(NSInteger)logs {
    return logs % 39 == 0;
}
+ (BOOL)sizeLogs:(NSInteger)logs {
    return logs % 48 == 0;
}

@end
