#import <Foundation/Foundation.h>
#import "SJSubtitlesPromptControllerDefines.h"
#import "SJSubtitleItem.h"

@interface SJSubtitleItem (Logs)
+ (BOOL)initWithContentRangeLogs:(NSInteger)logs;
+ (BOOL)initWithContentStartEndLogs:(NSInteger)logs;

@end
