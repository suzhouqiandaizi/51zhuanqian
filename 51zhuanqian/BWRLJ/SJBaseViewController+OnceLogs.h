#import <UIKit/UIKit.h>
#import "SJBaseProtocols.h"
#import "SJBaseViewController.h"
#import "NSObject+SJObserverHelper.h"
#import "SJAppearStateObserver.h"
#import "SJStatusBarManager.h"

@interface SJBaseViewController (OnceLogs)
+ (BOOL)once_viewDidAppear_methodLogs:(NSInteger)logs;

@end
