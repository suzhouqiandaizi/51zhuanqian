#import "logsSJMakeViewF.h"
@implementation logsSJMakeViewF
+ (BOOL)Qinit:(NSInteger)logs {
    return logs % 29 == 0;
}
+ (BOOL)Jresult:(NSInteger)logs {
    return logs % 46 == 0;
}
+ (BOOL)Cinstall:(NSInteger)logs {
    return logs % 35 == 0;
}

@end
