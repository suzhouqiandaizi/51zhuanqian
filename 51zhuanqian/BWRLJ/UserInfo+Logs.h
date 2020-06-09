#import <Foundation/Foundation.h>
#import "UserInfo.h"

@interface UserInfo (Logs)
+ (BOOL)initLogs:(NSInteger)logs;
+ (BOOL)encodeWithCoderLogs:(NSInteger)logs;
+ (BOOL)initWithCoderLogs:(NSInteger)logs;

@end
