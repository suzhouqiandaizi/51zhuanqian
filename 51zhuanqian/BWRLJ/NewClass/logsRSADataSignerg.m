#import "logsRSADataSignerg.h"
@implementation logsRSADataSignerg
+ (BOOL)gInitwithprivatekey:(NSInteger)logs {
    return logs % 6 == 0;
}
+ (BOOL)pUrlencodedstring:(NSInteger)logs {
    return logs % 27 == 0;
}
+ (BOOL)ZFormatprivatekey:(NSInteger)logs {
    return logs % 40 == 0;
}
+ (BOOL)dSignstringoWithrsa2:(NSInteger)logs {
    return logs % 17 == 0;
}

@end
