#import "SJAVMediaPlaybackController+ExportLogs.h"
@implementation SJAVMediaPlaybackController (ExportLogs)
+ (BOOL)exportWithBeginTimeDurationPresetnameProgressCompletionFailureLogs:(NSInteger)logs {
    return logs % 33 == 0;
}
+ (BOOL)cancelExportOperationLogs:(NSInteger)logs {
    return logs % 18 == 0;
}
+ (BOOL)generateGIFWithBeginTimeDurationMaximumsizeIntervalGifsavepathProgressCompletionFailureLogs:(NSInteger)logs {
    return logs % 26 == 0;
}
+ (BOOL)cancelGenerateGIFOperationLogs:(NSInteger)logs {
    return logs % 20 == 0;
}

@end
