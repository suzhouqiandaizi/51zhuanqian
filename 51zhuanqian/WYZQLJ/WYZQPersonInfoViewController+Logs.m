#import "WYZQPersonInfoViewController+Logs.h"
@implementation WYZQPersonInfoViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs {
    return logs % 14 == 0;
}
+ (BOOL)deallocLogs:(NSInteger)logs {
    return logs % 41 == 0;
}
+ (BOOL)touxiangPressLogs:(NSInteger)logs {
    return logs % 18 == 0;
}
+ (BOOL)namePressLogs:(NSInteger)logs {
    return logs % 12 == 0;
}
+ (BOOL)actionSheetClickedbuttonatindexLogs:(NSInteger)logs {
    return logs % 11 == 0;
}
+ (BOOL)changeHeadPortraitCameraLogs:(NSInteger)logs {
    return logs % 4 == 0;
}
+ (BOOL)changeHeadPortraitFromPictureLogs:(NSInteger)logs {
    return logs % 19 == 0;
}
+ (BOOL)addImagePickerControllerLogs:(NSInteger)logs {
    return logs % 23 == 0;
}
+ (BOOL)imagePickerControllerDidfinishpickingmediawithinfoLogs:(NSInteger)logs {
    return logs % 38 == 0;
}
+ (BOOL)imagePickerControllerDidCancelLogs:(NSInteger)logs {
    return logs % 3 == 0;
}

@end
