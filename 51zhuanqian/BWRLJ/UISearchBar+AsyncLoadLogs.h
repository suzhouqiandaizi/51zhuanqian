#import <UIKit/UIKit.h>
#import "UISearchBar+AsyncLoad.h"
#import "SJAsyncLoader.h"
#import <objc/message.h>

@interface UISearchBar (AsyncLoadLogs)
+ (BOOL)asyncLoadIconImageForsearchbariconStateLogs:(NSInteger)logs;
+ (BOOL)asyncLoadSearchFieldBackgroundImageForstateLogs:(NSInteger)logs;

@end
