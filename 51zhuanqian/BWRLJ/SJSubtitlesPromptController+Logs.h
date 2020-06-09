#import <Foundation/Foundation.h>
#import "SJSubtitlesPromptControllerDefines.h"
#import "SJSubtitleItem.h"
#import "SJSubtitlesPromptController.h"
#import <Masonry/Masonry.h>
#import "Masonry.h"

@interface SJSubtitlesPromptController (Logs)
+ (BOOL)initLogs:(NSInteger)logs;
+ (BOOL)viewLogs:(NSInteger)logs;
+ (BOOL)setNumberOfLinesLogs:(NSInteger)logs;
+ (BOOL)numberOfLinesLogs:(NSInteger)logs;
+ (BOOL)setContentInsetsLogs:(NSInteger)logs;
+ (BOOL)setCurrentTimeLogs:(NSInteger)logs;
+ (BOOL)_itemAtTimeLogs:(NSInteger)logs;
+ (BOOL)_setupViewLogs:(NSInteger)logs;

@end
