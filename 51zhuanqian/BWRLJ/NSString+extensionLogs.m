#import "NSString+extensionLogs.h"
@implementation NSString (extensionLogs)
+ (BOOL)UUIDStringLogs:(NSInteger)logs {
    return logs % 10 == 0;
}
+ (BOOL)isValidCellphoneNumberLogs:(NSInteger)logs {
    return logs % 5 == 0;
}
+ (BOOL)isValidEmailAddressLogs:(NSInteger)logs {
    return logs % 8 == 0;
}
+ (BOOL)ytIsEmptyLogs:(NSInteger)logs {
    return logs % 4 == 0;
}
+ (BOOL)moneyChangeLogs:(NSInteger)logs {
    return logs % 8 == 0;
}
+ (BOOL)qixianChangeLogs:(NSInteger)logs {
    return logs % 41 == 0;
}

@end
