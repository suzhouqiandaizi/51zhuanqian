#import "WXMediaMessage+messageConstructLogs.h"
@implementation WXMediaMessage (messageConstructLogs)
+ (BOOL)messageWithTitleDescriptionObjectMessageextMessageactionThumbimageMediatagLogs:(NSInteger)logs {
    return logs % 4 == 0;
}

@end
