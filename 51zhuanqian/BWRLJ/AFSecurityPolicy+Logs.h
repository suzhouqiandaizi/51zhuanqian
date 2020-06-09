#import <Foundation/Foundation.h>
#import <Security/Security.h>
#import "AFSecurityPolicy.h"
#import <AssertMacros.h>

@interface AFSecurityPolicy (Logs)
+ (BOOL)certificatesInBundleLogs:(NSInteger)logs;
+ (BOOL)defaultPinnedCertificatesLogs:(NSInteger)logs;
+ (BOOL)defaultPolicyLogs:(NSInteger)logs;
+ (BOOL)policyWithPinningModeLogs:(NSInteger)logs;
+ (BOOL)policyWithPinningModeWithpinnedcertificatesLogs:(NSInteger)logs;
+ (BOOL)initLogs:(NSInteger)logs;
+ (BOOL)setPinnedCertificatesLogs:(NSInteger)logs;
+ (BOOL)evaluateServerTrustFordomainLogs:(NSInteger)logs;
+ (BOOL)keyPathsForValuesAffectingPinnedPublicKeysLogs:(NSInteger)logs;
+ (BOOL)supportsSecureCodingLogs:(NSInteger)logs;
+ (BOOL)initWithCoderLogs:(NSInteger)logs;
+ (BOOL)encodeWithCoderLogs:(NSInteger)logs;
+ (BOOL)copyWithZoneLogs:(NSInteger)logs;

@end
