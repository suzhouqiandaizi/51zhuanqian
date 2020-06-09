#import "logsLongPressButtonk.h"
@implementation logsLongPressButtonk
+ (BOOL)OStoplogs:(NSInteger)logs {
    return logs % 21 == 0;
}
+ (BOOL)JSetpressingtouchendinvokeintervallogs:(NSInteger)logs {
    return logs % 8 == 0;
}
+ (BOOL)qTouchesbeganwitheventlogs:(NSInteger)logs {
    return logs % 41 == 0;
}
+ (BOOL)DTimesgobylogs:(NSInteger)logs {
    return logs % 49 == 0;
}
+ (BOOL)wTouchescancelledwitheventlogs:(NSInteger)logs {
    return logs % 35 == 0;
}
+ (BOOL)QTouchesendedwitheventlogs:(NSInteger)logs {
    return logs % 44 == 0;
}

@end
