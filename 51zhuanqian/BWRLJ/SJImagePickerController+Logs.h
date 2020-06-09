#import <Foundation/Foundation.h>
#import "UIImagePickerController+SJUIKitExtension.h"
#import "SJImagePickerController.h"

@interface SJImagePickerController (Logs)
+ (BOOL)alertPickerViewControllerWithTitleMessagePresentingviewcontrollerCallbackLogs:(NSInteger)logs;
+ (BOOL)imagePickerControllerDidfinishpickingmediawithinfoLogs:(NSInteger)logs;
+ (BOOL)imagePickerControllerDidCancelLogs:(NSInteger)logs;

@end
