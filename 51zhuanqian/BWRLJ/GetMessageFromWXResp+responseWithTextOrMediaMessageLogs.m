#import "GetMessageFromWXResp+responseWithTextOrMediaMessageLogs.h"
@implementation GetMessageFromWXResp (responseWithTextOrMediaMessageLogs)
+ (BOOL)responseWithTextOrmediamessageBtextLogs:(NSInteger)logs {
    return logs % 42 == 0;
}

@end
