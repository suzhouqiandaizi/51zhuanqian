#import <UIKit/UIKit.h>
#import "SJPlayModel.h"

@interface SJUITableViewHeaderViewPlayModel (Logs)
+ (BOOL)initWithPlayerSuperviewTableviewLogs:(NSInteger)logs;
+ (BOOL)isPlayInTableViewLogs:(NSInteger)logs;
+ (BOOL)isPlayInCollectionViewLogs:(NSInteger)logs;
+ (BOOL)inScrollViewLogs:(NSInteger)logs;

@end
