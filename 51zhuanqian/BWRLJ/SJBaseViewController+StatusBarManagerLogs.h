#import <UIKit/UIKit.h>
#import "SJBaseProtocols.h"
#import "SJBaseViewController.h"
#import "NSObject+SJObserverHelper.h"
#import "SJAppearStateObserver.h"
#import "SJStatusBarManager.h"

@interface SJBaseViewController (StatusBarManagerLogs)
+ (BOOL)statusBarManagerLogs:(NSInteger)logs;

@end
