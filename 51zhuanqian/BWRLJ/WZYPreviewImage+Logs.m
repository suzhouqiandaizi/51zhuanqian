#import "WZYPreviewImage+Logs.h"
@implementation WZYPreviewImage (Logs)
+ (BOOL)showPreviewWithImageViewLogs:(NSInteger)logs {
    return logs % 40 == 0;
}
+ (BOOL)previewImageWithViewLogs:(NSInteger)logs {
    return logs % 16 == 0;
}
+ (BOOL)touchesBeganWitheventLogs:(NSInteger)logs {
    return logs % 48 == 0;
}

@end
