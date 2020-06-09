#import "logsSJSQLiteTableInfoF.h"
@implementation logsSJSQLiteTableInfoF
+ (BOOL)VTableinfowithclass:(NSInteger)logs {
    return logs % 28 == 0;
}
+ (BOOL)fdescription:(NSInteger)logs {
    return logs % 22 == 0;
}
+ (BOOL)VColumninfoforproperty:(NSInteger)logs {
    return logs % 40 == 0;
}
+ (BOOL)IColumninfoforcolumnname:(NSInteger)logs {
    return logs % 36 == 0;
}

@end
