#import <Foundation/Foundation.h>
#import "XMLDictionary.h"
#import <Availability.h>

@interface NSDictionary (XMLDictionaryLogs)
+ (BOOL)dictionaryWithXMLParserLogs:(NSInteger)logs;
+ (BOOL)dictionaryWithXMLDataLogs:(NSInteger)logs;
+ (BOOL)dictionaryWithXMLStringLogs:(NSInteger)logs;
+ (BOOL)dictionaryWithXMLFileLogs:(NSInteger)logs;
+ (BOOL)attributesLogs:(NSInteger)logs;
+ (BOOL)childNodesLogs:(NSInteger)logs;
+ (BOOL)commentsLogs:(NSInteger)logs;
+ (BOOL)nodeNameLogs:(NSInteger)logs;
+ (BOOL)innerTextLogs:(NSInteger)logs;
+ (BOOL)innerXMLLogs:(NSInteger)logs;
+ (BOOL)XMLStringLogs:(NSInteger)logs;
+ (BOOL)arrayValueForKeyPathLogs:(NSInteger)logs;
+ (BOOL)stringValueForKeyPathLogs:(NSInteger)logs;
+ (BOOL)dictionaryValueForKeyPathLogs:(NSInteger)logs;

@end
