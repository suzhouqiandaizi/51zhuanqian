#import "MASUtilities.h"
#import "MASConstraintMaker.h"
#import "MASViewAttribute.h"
#import "NSArray+MASAdditions.h"
#import "View+MASAdditions.h"

@interface NSArray (MASAdditionsLogs)
+ (BOOL)mas_makeConstraintsLogs:(NSInteger)logs;
+ (BOOL)mas_updateConstraintsLogs:(NSInteger)logs;
+ (BOOL)mas_remakeConstraintsLogs:(NSInteger)logs;
+ (BOOL)mas_distributeViewsAlongAxisWithfixedspacingLeadspacingTailspacingLogs:(NSInteger)logs;
+ (BOOL)mas_distributeViewsAlongAxisWithfixeditemlengthLeadspacingTailspacingLogs:(NSInteger)logs;
+ (BOOL)mas_commonSuperviewOfViewsLogs:(NSInteger)logs;

@end
