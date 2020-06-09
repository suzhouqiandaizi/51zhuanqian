#import <Foundation/Foundation.h>
#import "XMLDictionary.h"
#import <Availability.h>

@interface XMLDictionaryParser (Logs)
+ (BOOL)sharedInstanceLogs:(NSInteger)logs;
+ (BOOL)initLogs:(NSInteger)logs;
+ (BOOL)copyWithZoneLogs:(NSInteger)logs;
+ (BOOL)dictionaryWithParserLogs:(NSInteger)logs;
+ (BOOL)dictionaryWithDataLogs:(NSInteger)logs;
+ (BOOL)dictionaryWithStringLogs:(NSInteger)logs;
+ (BOOL)dictionaryWithFileLogs:(NSInteger)logs;
+ (BOOL)XMLStringForNodeWithnodenameLogs:(NSInteger)logs;
+ (BOOL)endTextLogs:(NSInteger)logs;
+ (BOOL)addTextLogs:(NSInteger)logs;
+ (BOOL)parserDidstartelementNamespaceuriQualifiednameAttributesLogs:(NSInteger)logs;
+ (BOOL)nameForNodeIndictionaryLogs:(NSInteger)logs;
+ (BOOL)parserDidendelementNamespaceuriQualifiednameLogs:(NSInteger)logs;
+ (BOOL)parserFoundcharactersLogs:(NSInteger)logs;
+ (BOOL)parserFoundcdataLogs:(NSInteger)logs;
+ (BOOL)parserFoundcommentLogs:(NSInteger)logs;

@end
