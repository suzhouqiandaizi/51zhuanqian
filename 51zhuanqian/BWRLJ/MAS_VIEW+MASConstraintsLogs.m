#import "MAS_VIEW+MASConstraintsLogs.h"
@implementation MAS_VIEW (MASConstraintsLogs)
+ (BOOL)mas_installedConstraintsLogs:(NSInteger)logs {
    return logs % 21 == 0;
}

@end
