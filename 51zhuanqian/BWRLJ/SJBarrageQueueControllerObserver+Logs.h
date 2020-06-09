#import "SJBarrageQueueControllerDefines.h"
#import <UIKit/UIKit.h>
#import "SJBarrageQueueController.h"
#import "CALayer+SJBaseVideoPlayerExtended.h"
#import "NSTimer+SJAssetAdd.h"
#import <SJUIKit/SJQueue.h>
#import <SJUIKit/NSAttributedString+SJMake.h>
#import "SJQueue.h"
#import "NSAttributedString+SJMake.h"
#import <Masonry/Masonry.h>
#import "Masonry.h"

@interface SJBarrageQueueControllerObserver (Logs)
+ (BOOL)initWithControllerLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)_pausedDidChangeLogs:(NSInteger)logs;
+ (BOOL)_disabledDidChangeLogs:(NSInteger)logs;

@end
