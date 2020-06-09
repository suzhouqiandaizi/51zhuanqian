#import "logsBWRZQLoginPrivacyProtocolViewF.h"
@implementation logsBWRZQLoginPrivacyProtocolViewF
+ (BOOL)BinitItem:(NSInteger)logs {
    return logs % 12 == 0;
}
+ (BOOL)gremovePress:(NSInteger)logs {
    return logs % 50 == 0;
}
+ (BOOL)KexitPress:(NSInteger)logs {
    return logs % 27 == 0;
}
+ (BOOL)cagreePress:(NSInteger)logs {
    return logs % 37 == 0;
}

@end
