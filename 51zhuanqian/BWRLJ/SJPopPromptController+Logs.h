#import "SJPopPromptControllerDefines.h"
#import "SJPopPromptController.h"
#import <Masonry/Masonry.h>
#import "Masonry.h"

@interface SJPopPromptController (Logs)
+ (BOOL)initLogs:(NSInteger)logs;
+ (BOOL)setBottomMarginLogs:(NSInteger)logs;
+ (BOOL)showLogs:(NSInteger)logs;
+ (BOOL)showDurationLogs:(NSInteger)logs;
+ (BOOL)showCustomViewLogs:(NSInteger)logs;
+ (BOOL)showCustomViewDurationLogs:(NSInteger)logs;
+ (BOOL)isShowingWithCustomViewLogs:(NSInteger)logs;
+ (BOOL)clearLogs:(NSInteger)logs;
+ (BOOL)_showDurationLogs:(NSInteger)logs;
+ (BOOL)_addSubviewLogs:(NSInteger)logs;
+ (BOOL)_removeSubviewLogs:(NSInteger)logs;
+ (BOOL)_removeAllSubviewsLogs:(NSInteger)logs;
+ (BOOL)_remakeConstraintsAtIndexLogs:(NSInteger)logs;

@end
