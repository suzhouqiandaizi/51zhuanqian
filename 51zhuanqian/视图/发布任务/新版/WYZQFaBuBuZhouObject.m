#import "WYZQFaBuBuZhouObject.h"
@implementation WYZQFaBuBuZhouObject
+(instancetype)buzhouItemDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}
-(id)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self)
    {
        [self setContent:dic];
    }
    return self;
}
- (void)setContent:(NSDictionary *)dic{
    self.index = [[dic objectForKey:@"sortValue"] intValue];
    if ([[dic objectForKey:@"taskStepType"] isEqualToString:@"LINK"]) {
        self.type = 2;
        self.linkStr = [[dic objectForKey:@"taskLinks"] firstObject];
    }else if ([[dic objectForKey:@"taskStepType"] isEqualToString:@"INFO"]){
        self.type = 3;
        self.fuzhiStr = [dic objectForKey:@"taskCopyInfo"];
    }else{
        self.type = 1;
        self.images = [dic objectForKey:@"taskStepImages"];
    }
    self.contentStr = [dic objectForKey:@"taskDescription"];
    self.isCreated = NO;
}
@end
