#import "logsAFXMLParserResponseSerializerC.h"
@implementation logsAFXMLParserResponseSerializerC
+ (BOOL)fserializer:(NSInteger)logs {
    return logs % 32 == 0;
}
+ (BOOL)Uinit:(NSInteger)logs {
    return logs % 22 == 0;
}
+ (BOOL)RResponseobjectforresponserDataPError:(NSInteger)logs {
    return logs % 15 == 0;
}

@end
