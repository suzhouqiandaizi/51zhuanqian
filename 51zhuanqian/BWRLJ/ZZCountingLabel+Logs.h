#import <UIKit/UIKit.h>
#import "ZZCountingLabel.h"

@interface ZZCountingLabel (Logs)
+ (BOOL)initLogs:(NSInteger)logs;
+ (BOOL)initWithFrameLogs:(NSInteger)logs;
+ (BOOL)awakeFromNibLogs:(NSInteger)logs;
+ (BOOL)initValuesLogs:(NSInteger)logs;
+ (BOOL)countingFromToLogs:(NSInteger)logs;
+ (BOOL)countingFromToDurationLogs:(NSInteger)logs;
+ (BOOL)countingActionLogs:(NSInteger)logs;
+ (BOOL)stopDisplayLinkLogs:(NSInteger)logs;

@end
