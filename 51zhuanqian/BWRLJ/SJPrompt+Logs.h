#import "SJPromptDefines.h"
#import "SJPrompt.h"
#import <Masonry/Masonry.h>
#import "Masonry.h"

@interface SJPrompt (Logs)
+ (BOOL)initLogs:(NSInteger)logs;
+ (BOOL)showLogs:(NSInteger)logs;
+ (BOOL)showDurationLogs:(NSInteger)logs;
+ (BOOL)showDurationCompletionhandlerLogs:(NSInteger)logs;
+ (BOOL)hiddenLogs:(NSInteger)logs;
+ (BOOL)setCornerRadiusLogs:(NSInteger)logs;
+ (BOOL)cornerRadiusLogs:(NSInteger)logs;
+ (BOOL)setBackgroundColorLogs:(NSInteger)logs;
+ (BOOL)backgroundColorLogs:(NSInteger)logs;
+ (BOOL)contentViewLogs:(NSInteger)logs;
+ (BOOL)labelLogs:(NSInteger)logs;

@end
