#import <UIKit/UIKit.h>
#import "UIButton+AsyncLoadImage.h"
#import "SJAsyncLoader.h"
#import <objc/message.h>

@interface UIButton (AsyncLoadImageLogs)
+ (BOOL)asyncLoadImageForstateLogs:(NSInteger)logs;
+ (BOOL)asyncLoadImageForstatePlaceholderimageLogs:(NSInteger)logs;
+ (BOOL)asyncLoadBackgroundImageForstateLogs:(NSInteger)logs;
+ (BOOL)asyncLoadBackgroundImageForstatePlaceholderimageLogs:(NSInteger)logs;
+ (BOOL)asyncLoadAttributedStringForstateLogs:(NSInteger)logs;

@end
