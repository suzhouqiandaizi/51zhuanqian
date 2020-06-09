#import "logsSJBaseTableViewHeaderFooterViewG.h"
@implementation logsSJBaseTableViewHeaderFooterViewG
+ (BOOL)NreuseIdentifier:(NSInteger)logs {
    return logs % 19 == 0;
}
+ (BOOL)HRegisterwithtableview:(NSInteger)logs {
    return logs % 45 == 0;
}
+ (BOOL)uReusableviewwithtableview:(NSInteger)logs {
    return logs % 28 == 0;
}

@end
