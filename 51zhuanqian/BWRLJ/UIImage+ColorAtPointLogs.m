#import "UIImage+ColorAtPointLogs.h"
@implementation UIImage (ColorAtPointLogs)
+ (BOOL)colorAtPointLogs:(NSInteger)logs {
    return logs % 7 == 0;
}

@end
