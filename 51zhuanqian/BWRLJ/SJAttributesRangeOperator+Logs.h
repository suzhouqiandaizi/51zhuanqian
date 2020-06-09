#import <UIKit/UIKit.h>
#import "SJAttributesRecorder.h"
#import "SJAttributeWorker.h"
#import <CoreText/CoreText.h>
#import <objc/message.h>
#import "SJAttributesRecorder.h"

@interface SJAttributesRangeOperator (Logs)
+ (BOOL)initWithRangeTargetLogs:(NSInteger)logs;
+ (BOOL)initWithRecorderTargetLogs:(NSInteger)logs;
+ (BOOL)resetLogs:(NSInteger)logs;
+ (BOOL)addAttributesToTargetIfNeededLogs:(NSInteger)logs;
+ (BOOL)removeAttributeWithKeyLogs:(NSInteger)logs;

@end
