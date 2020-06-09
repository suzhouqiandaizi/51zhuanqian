#import <Foundation/Foundation.h>
#import <TargetConditionals.h>
#import <UIKit/UIKit.h>
#import <WatchKit/WatchKit.h>
#import "AFURLRequestSerialization.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <CoreServices/CoreServices.h>

@interface AFJSONRequestSerializer (Logs)
+ (BOOL)serializerLogs:(NSInteger)logs;
+ (BOOL)serializerWithWritingOptionsLogs:(NSInteger)logs;
+ (BOOL)requestBySerializingRequestWithparametersErrorLogs:(NSInteger)logs;
+ (BOOL)initWithCoderLogs:(NSInteger)logs;
+ (BOOL)encodeWithCoderLogs:(NSInteger)logs;
+ (BOOL)copyWithZoneLogs:(NSInteger)logs;

@end
