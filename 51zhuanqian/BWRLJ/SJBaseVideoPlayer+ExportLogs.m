#import "SJBaseVideoPlayer+ExportLogs.h"
@implementation SJBaseVideoPlayer (ExportLogs)
+ (BOOL)exportWithBeginTimeDurationPresetnameProgressCompletionFailureLogs:(NSInteger)logs {
    return logs % 10 == 0;
}
+ (BOOL)cancelExportOperationLogs:(NSInteger)logs {
    return logs % 39 == 0;
}
+ (BOOL)generateGIFWithBeginTimeDurationProgressCompletionFailureLogs:(NSInteger)logs {
    return logs % 5 == 0;
}
+ (BOOL)cancelGenerateGIFOperationLogs:(NSInteger)logs {
    return logs % 11 == 0;
}

@end
