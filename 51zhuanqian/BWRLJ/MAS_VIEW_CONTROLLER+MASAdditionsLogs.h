#import "MASUtilities.h"
#import "MASConstraintMaker.h"
#import "MASViewAttribute.h"
#import "ViewController+MASAdditions.h"

@interface MAS_VIEW_CONTROLLER (MASAdditionsLogs)
+ (BOOL)mas_topLayoutGuideLogs:(NSInteger)logs;
+ (BOOL)mas_topLayoutGuideTopLogs:(NSInteger)logs;
+ (BOOL)mas_topLayoutGuideBottomLogs:(NSInteger)logs;
+ (BOOL)mas_bottomLayoutGuideLogs:(NSInteger)logs;
+ (BOOL)mas_bottomLayoutGuideTopLogs:(NSInteger)logs;
+ (BOOL)mas_bottomLayoutGuideBottomLogs:(NSInteger)logs;

@end
