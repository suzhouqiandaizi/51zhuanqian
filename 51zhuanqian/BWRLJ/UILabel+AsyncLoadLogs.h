#import <UIKit/UIKit.h>
#import "UILabel+AsyncLoad.h"
#import "SJAsyncLoader.h"
#import <objc/message.h>

@interface UILabel (AsyncLoadLogs)
+ (BOOL)asyncLoadAttributedStringLogs:(NSInteger)logs;

@end
