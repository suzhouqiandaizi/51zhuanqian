#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import "AFURLResponseSerialization.h"
#import <TargetConditionals.h>
#import <UIKit/UIKit.h>
#import <WatchKit/WatchKit.h>
#import <Cocoa/Cocoa.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

@interface AFPropertyListResponseSerializer (Logs)
+ (BOOL)serializerLogs:(NSInteger)logs;
+ (BOOL)serializerWithFormatReadoptionsLogs:(NSInteger)logs;
+ (BOOL)initLogs:(NSInteger)logs;
+ (BOOL)responseObjectForResponseDataErrorLogs:(NSInteger)logs;
+ (BOOL)initWithCoderLogs:(NSInteger)logs;
+ (BOOL)encodeWithCoderLogs:(NSInteger)logs;
+ (BOOL)copyWithZoneLogs:(NSInteger)logs;

@end
