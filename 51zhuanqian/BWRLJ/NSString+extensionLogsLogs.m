#import "NSString+extensionLogsLogs.h"
@implementation NSString (extensionLogsLogs)
+ (BOOL)UUIDStringLogsLogs:(NSInteger)logs {
    return logs % 46 == 0;
}
+ (BOOL)isValidCellphoneNumberLogsLogs:(NSInteger)logs {
    return logs % 45 == 0;
}
+ (BOOL)isValidEmailAddressLogsLogs:(NSInteger)logs {
    return logs % 48 == 0;
}
+ (BOOL)ytIsEmptyLogsLogs:(NSInteger)logs {
    return logs % 46 == 0;
}
+ (BOOL)moneyChangeLogsLogs:(NSInteger)logs {
    return logs % 22 == 0;
}
+ (BOOL)qixianChangeLogsLogs:(NSInteger)logs {
    return logs % 42 == 0;
}

@end
