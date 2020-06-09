#import "logsOrderS.h"
@implementation logsOrderS
+ (BOOL)ZOrderinfoencoded:(NSInteger)logs {
    return logs % 41 == 0;
}
+ (BOOL)jOrderitemwithkeyOAndvalueEEncoded:(NSInteger)logs {
    return logs % 30 == 0;
}
+ (BOOL)IEncodevalue:(NSInteger)logs {
    return logs % 20 == 0;
}

@end
