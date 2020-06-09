#import "TAAbstractDotView.h"
#import "TAAnimatedDotView.h"

@interface TAAnimatedDotView (Logs)
+ (BOOL)initLogs:(NSInteger)logs;
+ (BOOL)initWithFrameLogs:(NSInteger)logs;
+ (BOOL)initWithCoderLogs:(NSInteger)logs;
+ (BOOL)setDotColorLogs:(NSInteger)logs;
+ (BOOL)initializationLogs:(NSInteger)logs;
+ (BOOL)changeActivityStateLogs:(NSInteger)logs;
+ (BOOL)animateToActiveStateLogs:(NSInteger)logs;
+ (BOOL)animateToDeactiveStateLogs:(NSInteger)logs;

@end
