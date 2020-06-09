#import "logsSJFilmEditingButtonContainerViewd.h"
@implementation logsSJFilmEditingButtonContainerViewd
+ (BOOL)cInitwithframemButtonsize:(NSInteger)logs {
    return logs % 33 == 0;
}
+ (BOOL)jClickedbackbtn:(NSInteger)logs {
    return logs % 10 == 0;
}

@end
