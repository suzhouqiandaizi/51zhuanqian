#import "SJAttributeWorker+InsertLogs.h"
@implementation SJAttributeWorker (InsertLogs)
+ (BOOL)setLastInsertedRangeLogs:(NSInteger)logs {
    return logs % 37 == 0;
}
+ (BOOL)lastInsertedRangeLogs:(NSInteger)logs {
    return logs % 21 == 0;
}
+ (BOOL)(void (^ _Nonnull)(SJAttributesRangeOperator * _Nonnull)))lastInsertedLogs:(NSInteger)logs {
    return logs % 46 == 0;
}
+ (BOOL)(NSAttributedStringKey _Nonnull, id _Nonnull, NSRange))addLogs:(NSInteger)logs {
    return logs % 22 == 0;
}
+ (BOOL)(id _Nonnull, ...))appendLogs:(NSInteger)logs {
    return logs % 11 == 0;
}
+ (BOOL)(NSString * _Nonnull, NSInteger))insertTextLogs:(NSInteger)logs {
    return logs % 29 == 0;
}
+ (BOOL)(UIImage * _Nonnull, NSInteger, CGPoint, CGSize))insertImageLogs:(NSInteger)logs {
    return logs % 10 == 0;
}
+ (BOOL)(NSAttributedString * _Nonnull, NSInteger))insertAttrStrLogs:(NSInteger)logs {
    return logs % 31 == 0;
}
+ (BOOL)(id _Nonnull, NSInteger, ...))insertLogs:(NSInteger)logs {
    return logs % 38 == 0;
}

@end
