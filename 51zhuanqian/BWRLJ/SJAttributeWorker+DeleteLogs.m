#import "SJAttributeWorker+DeleteLogs.h"
@implementation SJAttributeWorker (DeleteLogs)
+ (BOOL)(NSRange))removeTextLogs:(NSInteger)logs {
    return logs % 25 == 0;
}
+ (BOOL)(NSAttributedStringKey _Nonnull, NSRange))removeAttributeLogs:(NSInteger)logs {
    return logs % 33 == 0;
}
+ (BOOL)(NSRange))removeAttributesLogs:(NSInteger)logs {
    return logs % 28 == 0;
}

@end
