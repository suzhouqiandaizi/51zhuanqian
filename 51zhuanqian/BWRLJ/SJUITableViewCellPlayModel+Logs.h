#import <UIKit/UIKit.h>
#import "SJPlayModel.h"

@interface SJUITableViewCellPlayModel (Logs)
+ (BOOL)initWithPlayerSuperviewAtindexpathTableviewLogs:(NSInteger)logs;
+ (BOOL)initWithPlayerSuperviewTagAtindexpathTableviewLogs:(NSInteger)logs;
+ (BOOL)isPlayInTableViewLogs:(NSInteger)logs;
+ (BOOL)isPlayInCollectionViewLogs:(NSInteger)logs;
+ (BOOL)playerSuperviewLogs:(NSInteger)logs;
+ (BOOL)inScrollViewLogs:(NSInteger)logs;

@end
