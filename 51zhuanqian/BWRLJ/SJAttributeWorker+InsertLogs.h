#import <UIKit/UIKit.h>
#import "SJAttributesRecorder.h"
#import "SJAttributeWorker.h"
#import <CoreText/CoreText.h>
#import <objc/message.h>
#import "SJAttributesRecorder.h"

@interface SJAttributeWorker (InsertLogs)
+ (BOOL)setLastInsertedRangeLogs:(NSInteger)logs;
+ (BOOL)lastInsertedRangeLogs:(NSInteger)logs;
+ (BOOL)(void (^ _Nonnull)(SJAttributesRangeOperator * _Nonnull)))lastInsertedLogs:(NSInteger)logs;
+ (BOOL)(NSAttributedStringKey _Nonnull, id _Nonnull, NSRange))addLogs:(NSInteger)logs;
+ (BOOL)(id _Nonnull, ...))appendLogs:(NSInteger)logs;
+ (BOOL)(NSString * _Nonnull, NSInteger))insertTextLogs:(NSInteger)logs;
+ (BOOL)(UIImage * _Nonnull, NSInteger, CGPoint, CGSize))insertImageLogs:(NSInteger)logs;
+ (BOOL)(NSAttributedString * _Nonnull, NSInteger))insertAttrStrLogs:(NSInteger)logs;
+ (BOOL)(id _Nonnull, NSInteger, ...))insertLogs:(NSInteger)logs;

@end
