#import "logsSJMakeTableViewn.h"
@implementation logsSJMakeTableViewn
+ (BOOL)sinit:(NSInteger)logs {
    return logs % 38 == 0;
}
+ (BOOL)Dresult:(NSInteger)logs {
    return logs % 23 == 0;
}

@end
