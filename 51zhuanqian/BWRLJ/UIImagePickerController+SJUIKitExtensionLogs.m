#import "UIImagePickerController+SJUIKitExtensionLogs.h"
@implementation UIImagePickerController (SJUIKitExtensionLogs)
+ (BOOL)setSj_didFinishPickingImageHandlerLogs:(NSInteger)logs {
    return logs % 35 == 0;
}
+ (BOOL)(UIImage *))sj_didFinishPickingImageHandlerLogs:(NSInteger)logs {
    return logs % 42 == 0;
}

@end
