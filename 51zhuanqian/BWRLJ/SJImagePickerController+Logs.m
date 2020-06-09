#import "SJImagePickerController+Logs.h"
@implementation SJImagePickerController (Logs)
+ (BOOL)alertPickerViewControllerWithTitleMessagePresentingviewcontrollerCallbackLogs:(NSInteger)logs {
    return logs % 12 == 0;
}
+ (BOOL)imagePickerControllerDidfinishpickingmediawithinfoLogs:(NSInteger)logs {
    return logs % 45 == 0;
}
+ (BOOL)imagePickerControllerDidCancelLogs:(NSInteger)logs {
    return logs % 10 == 0;
}

@end
