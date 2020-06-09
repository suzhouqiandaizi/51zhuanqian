#import <UIKit/UIKit.h>
#import "SJPlayModel.h"
#import "SJVideoPlayerPlaybackControllerDefines.h"
#import "SJVideoPlayerURLAsset.h"
#import <objc/message.h>
#import <SJUIKit/NSObject+SJObserverHelper.h>
#import "NSObject+SJObserverHelper.h"

@interface SJVideoPlayerURLAssetObserver (Logs)
+ (BOOL)initWithAssetLogs:(NSInteger)logs;
+ (BOOL)observeValueForKeyPathOfobjectChangeContextLogs:(NSInteger)logs;

@end
