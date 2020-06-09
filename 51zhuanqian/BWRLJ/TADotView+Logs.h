#import "TAAbstractDotView.h"
#import "TADotView.h"

@interface TADotView (Logs)
+ (BOOL)initLogs:(NSInteger)logs;
+ (BOOL)initWithFrameLogs:(NSInteger)logs;
+ (BOOL)initWithCoderLogs:(NSInteger)logs;
+ (BOOL)initializationLogs:(NSInteger)logs;
+ (BOOL)changeActivityStateLogs:(NSInteger)logs;

@end
