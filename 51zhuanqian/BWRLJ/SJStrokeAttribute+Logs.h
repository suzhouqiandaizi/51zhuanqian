#import <UIKit/UIKit.h>
#import "SJAttributesRecorder.h"
#import <objc/message.h>

@interface SJStrokeAttribute (Logs)
+ (BOOL)strokeWithValueColorLogs:(NSInteger)logs;
+ (BOOL)initWithValueColorLogs:(NSInteger)logs;
+ (BOOL)mutableCopyWithZoneLogs:(NSInteger)logs;

@end
