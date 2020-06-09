#import "logsSJSQLiteColumnInfoN.h"
@implementation logsSJSQLiteColumnInfoN
+ (BOOL)RSetassociatedobjectinfos:(NSInteger)logs {
    return logs % 13 == 0;
}
+ (BOOL)CassociatedObjectInfos:(NSInteger)logs {
    return logs % 9 == 0;
}

@end
