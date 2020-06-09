#import <UIKit/UIKit.h>
#import "SJAttributesRecorder.h"
#import <objc/message.h>

@interface SJUnderlineAttribute (Logs)
+ (BOOL)underLineWithStyleColorLogs:(NSInteger)logs;
+ (BOOL)initWithStyleColorLogs:(NSInteger)logs;
+ (BOOL)mutableCopyWithZoneLogs:(NSInteger)logs;

@end
