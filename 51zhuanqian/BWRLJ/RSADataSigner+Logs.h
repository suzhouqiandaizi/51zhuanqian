#import <Foundation/Foundation.h>
#import "RSADataSigner.h"
#import "openssl_wrapper.h"
#import "NSDataEx.h"

@interface RSADataSigner (Logs)
+ (BOOL)initWithPrivateKeyLogs:(NSInteger)logs;
+ (BOOL)urlEncodedStringLogs:(NSInteger)logs;
+ (BOOL)formatPrivateKeyLogs:(NSInteger)logs;
+ (BOOL)signStringWithrsa2Logs:(NSInteger)logs;

@end
