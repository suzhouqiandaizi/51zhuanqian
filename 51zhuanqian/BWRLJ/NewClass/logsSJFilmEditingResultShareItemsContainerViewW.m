#import "logsSJFilmEditingResultShareItemsContainerViewW.h"
@implementation logsSJFilmEditingResultShareItemsContainerViewW
+ (BOOL)DClickedbtn:(NSInteger)logs {
    return logs % 40 == 0;
}
+ (BOOL)VSetshareitems:(NSInteger)logs {
    return logs % 41 == 0;
}

@end
