#import <UIKit/UIKit.h>
#import "SJAttributesRecorder.h"
#import "SJAttributeWorker.h"
#import <CoreText/CoreText.h>
#import <objc/message.h>
#import "SJAttributesRecorder.h"

@interface SJAttributeWorker (RegexpLogs)
+ (BOOL)setRegexpOptionsLogs:(NSInteger)logs;
+ (BOOL)regexpOptionsLogs:(NSInteger)logs;
+ (BOOL)(NSString * _Nonnull, void (^ _Nonnull)(SJAttributesRangeOperator * _Nonnull)))regexpLogs:(NSInteger)logs;
+ (BOOL)(NSString * _Nonnull, void (^ _Nonnull)(NSArray<NSValue *> * _Nonnull), BOOL reverse))regexp_rLogs:(NSInteger)logs;
+ (BOOL)(NSString * _Nonnull, id _Nonnull, ...))regexp_replaceLogs:(NSInteger)logs;
+ (BOOL)(NSString * _Nonnull, SJAttributeRegexpInsertPosition, id _Nonnull, ...))regexp_insertLogs:(NSInteger)logs;

@end
