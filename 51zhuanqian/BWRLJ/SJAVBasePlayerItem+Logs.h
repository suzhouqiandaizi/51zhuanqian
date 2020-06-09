#import <AVFoundation/AVFoundation.h>
#import "SJAVBasePlayerItem.h"

@interface SJAVBasePlayerItem (Logs)
+ (BOOL)initWithAssetLogs:(NSInteger)logs;
+ (BOOL)_initObservationsLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)observeValueForKeyPathOfobjectChangeContextLogs:(NSInteger)logs;

@end
