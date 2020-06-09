#import "logsSJBaseTableViewCello.h"
@implementation logsSJBaseTableViewCello
+ (BOOL)LreuseIdentifier:(NSInteger)logs {
    return logs % 20 == 0;
}
+ (BOOL)SRegisterwithtableview:(NSInteger)logs {
    return logs % 37 == 0;
}
+ (BOOL)vCellwithtableviewYIndexpath:(NSInteger)logs {
    return logs % 44 == 0;
}

@end
