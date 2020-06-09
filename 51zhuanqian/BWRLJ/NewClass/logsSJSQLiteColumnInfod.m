#import "logsSJSQLiteColumnInfod.h"
@implementation logsSJSQLiteColumnInfod
+ (BOOL)Hdescription:(NSInteger)logs {
    return logs % 14 == 0;
}
+ (BOOL)oCopywithzone:(NSInteger)logs {
    return logs % 30 == 0;
}

@end
