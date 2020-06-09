#import <Foundation/Foundation.h>
#import "RSADataVerifier.h"
#import "openssl_wrapper.h"
#import "NSDataEx.h"
#import "base64.h"

@interface RSADataVerifier (Logs)
+ (BOOL)initWithPublicKeyLogs:(NSInteger)logs;
+ (BOOL)formatPublicKeyLogs:(NSInteger)logs;
+ (BOOL)verifyStringWithsignWithrsa2Logs:(NSInteger)logs;

@end
