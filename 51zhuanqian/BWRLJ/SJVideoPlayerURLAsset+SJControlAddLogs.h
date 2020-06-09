#import <SJBaseVideoPlayer/SJVideoPlayerURLAsset.h>
#import "SJVideoPlayerURLAsset.h"
#import "SJVideoPlayerURLAsset+SJControlAdd.h"
#import <objc/message.h>

@interface SJVideoPlayerURLAsset (SJControlAddLogs)
+ (BOOL)initWithTitleUrlPlaymodelLogs:(NSInteger)logs;
+ (BOOL)initWithTitleUrlSpecifystarttimePlaymodelLogs:(NSInteger)logs;
+ (BOOL)setTitleLogs:(NSInteger)logs;
+ (BOOL)titleLogs:(NSInteger)logs;
+ (BOOL)initWithAttributedTitleUrlPlaymodelLogs:(NSInteger)logs;
+ (BOOL)initWithAttributedTitleUrlSpecifystarttimePlaymodelLogs:(NSInteger)logs;
+ (BOOL)setAttributedTitleLogs:(NSInteger)logs;
+ (BOOL)attributedTitleLogs:(NSInteger)logs;

@end
