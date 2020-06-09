#import <UIKit/UIKit.h>
#import "UIView+SJAnimationAdded.h"
#import <objc/message.h>
#import "SJVideoPlayerAnimationHeader.h"

@interface UIView (SJAnimationAddedLogs)
+ (BOOL)setSjv_disappearedLogs:(NSInteger)logs;
+ (BOOL)sjv_disappearedLogs:(NSInteger)logs;
+ (BOOL)setSjv_disappearDirectionLogs:(NSInteger)logs;
+ (BOOL)sjv_disappearDirectionLogs:(NSInteger)logs;
+ (BOOL)sjv_disapearLogs:(NSInteger)logs;
+ (BOOL)sjv_appearLogs:(NSInteger)logs;

@end
