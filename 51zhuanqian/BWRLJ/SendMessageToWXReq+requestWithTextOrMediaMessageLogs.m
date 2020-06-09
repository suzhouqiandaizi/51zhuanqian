#import "SendMessageToWXReq+requestWithTextOrMediaMessageLogs.h"
@implementation SendMessageToWXReq (requestWithTextOrMediaMessageLogs)
+ (BOOL)requestWithTextOrmediamessageBtextInsceneLogs:(NSInteger)logs {
    return logs % 50 == 0;
}

@end
