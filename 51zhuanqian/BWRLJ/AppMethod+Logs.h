#import <Foundation/Foundation.h>
#import "AppMethod.h"
#import <CommonCrypto/CommonDigest.h>

@interface AppMethod (Logs)
+ (BOOL)sharedLogs:(NSInteger)logs;
+ (BOOL)getRandomStringLogs:(NSInteger)logs;
+ (BOOL)deviceIPAdressLogs:(NSInteger)logs;
+ (BOOL)partnerSignOrderLogs:(NSInteger)logs;
+ (BOOL)signStringLogs:(NSInteger)logs;

@end
