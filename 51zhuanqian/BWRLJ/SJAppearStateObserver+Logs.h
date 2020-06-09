#import <UIKit/UIKit.h>
#import "SJBaseProtocols.h"
#import "SJAppearStateObserver.h"
#import "NSObject+SJObserverHelper.h"

@interface SJAppearStateObserver (Logs)
+ (BOOL)initWithViewControllerLogs:(NSInteger)logs;
+ (BOOL)observeValueForKeyPathOfobjectChangeContextLogs:(NSInteger)logs;

@end
