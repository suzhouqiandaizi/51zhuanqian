#import "MASUtilities.h"
#import "MASViewAttribute.h"

@interface MASViewAttribute (Logs)
+ (BOOL)initWithViewLayoutattributeLogs:(NSInteger)logs;
+ (BOOL)initWithViewItemLayoutattributeLogs:(NSInteger)logs;
+ (BOOL)isSizeAttributeLogs:(NSInteger)logs;
+ (BOOL)isEqualLogs:(NSInteger)logs;
+ (BOOL)hashLogs:(NSInteger)logs;

@end
