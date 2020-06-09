#import "logsSJSQLite3TableInfosCacher.h"
@implementation logsSJSQLite3TableInfosCacher
+ (BOOL)Gshared:(NSInteger)logs {
    return logs % 4 == 0;
}
+ (BOOL)Winit:(NSInteger)logs {
    return logs % 47 == 0;
}
+ (BOOL)AGettableinfoforclass:(NSInteger)logs {
    return logs % 27 == 0;
}

@end
