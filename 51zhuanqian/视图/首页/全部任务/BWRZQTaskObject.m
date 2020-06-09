#import "BWRZQTaskObject.h"
#import "BWRZQFaBuBuZhouObject.h"
@implementation BWRZQTaskObject
+(instancetype)taskItemDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}
+(instancetype)taskDetailDic:(NSDictionary *)dic{
    return [[self alloc] initWithDetailDic:dic];
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
-(id)initWithDetailDic:(NSDictionary *)dic
{
    self = [super init];
    if (self)
    {
        [self setDetailContent:dic];
    }
    return self;
}
- (void)setContent:(NSDictionary *)dic{
    self.taskId = [dic objectForKey:@"taskNo"];
    self.taskType = [dic objectForKey:@"taskType"];
    self.iconUrl = [dic objectForKey:@"taskThumb"];
    self.title = [dic objectForKey:@"taskTitle"];
    self.approvedUserCount = [NSString stringWithFormat:@"%@", [dic objectForKey:@"approvedUserCount"]];
    self.leftBidTime = [NSString stringWithFormat:@"%@", [dic objectForKey:@"leftBidTime"]];
    self.rewardAmountDisplay = [dic objectForKey:@"rewardAmountDisplay"];
    self.iconArr = [dic objectForKey:@"typeAndTagIcons"];
    self.publisherPlatformId = [dic objectForKey:@"publisherPlatformId"];
    self.thirdpartyKeyStr = [dic objectForKey:@"thirdpartyKey"];
    NSString *zidaillq = [dic objectForKey:@"openView"];
    if ([zidaillq isEqualToString:@"browser"]) {
        self.zidailiulangqi = YES;
    }else{
        self.zidailiulangqi = NO;
    }
    self.taskStatusUrl = [dic objectForKey:@"userStatusForTheTask"];
}
- (void)setDetailContent:(NSDictionary *)dic{
    self.taskId = [dic objectForKey:@"taskNo"];
    self.orderId = [dic objectForKey:@"orderNo"];
    self.title = [dic objectForKey:@"taskTitle"];
    self.approvedUserCount = [NSString stringWithFormat:@"%@", [dic objectForKey:@"approveCount"]];
    self.approveUserVartarsArr = [dic objectForKey:@"approveUserVartars"];
    self.allowToBidFlag = [[dic objectForKey:@"allowToBidFlag"] boolValue];
    self.bidSubmitDurationHours = [dic objectForKey:@"bidSubmitDurationTimeDisplay"];
    self.endTimeDisplay = [dic objectForKey:@"endTimeDisplay"];
    self.leftBidTime = [NSString stringWithFormat:@"%@", [dic objectForKey:@"leftBidTime"]];
    self.publisherName = [dic objectForKey:@"publisherName"];
    self.publisherPlatformId = [dic objectForKey:@"publisherPlatformId"];
    self.publisherVartar = [dic objectForKey:@"publisherVartar"];
    self.rewardAmountDisplay = [dic objectForKey:@"rewardAmountDisplay"];
    self.taskCategory = [dic objectForKey:@"taskCategory"];
    if ([[dic objectForKey:@"taskLinks"] count] > 0) {
        self.taskLinks = [[dic objectForKey:@"taskLinks"] firstObject];
    }else{
        self.taskLinks = @"";
    }
    self.taskRequirement = [dic objectForKey:@"taskRequirement"];
    self.taskRequirementImages = [dic objectForKey:@"taskRequirementImages"];
    self.taskSteps = [dic objectForKey:@"taskSteps"];
    self.taskStepImages = [dic objectForKey:@"taskStepImages"];
    self.taskType = [dic objectForKey:@"taskType"];
    self.bidTimesByUser = [NSString stringWithFormat:@"每人仅可做%@次", [dic objectForKey:@"bidTimesByUser"]];
    self.thirdpartyKeyStr = [dic objectForKey:@"thirdpartyKey"];
    NSString *zidaillq = [dic objectForKey:@"openView"];
    if ([zidaillq isEqualToString:@"browser"]) {
        self.zidailiulangqi = YES;
    }else{
        self.zidailiulangqi = NO;
    }
    NSArray *steps = [dic objectForKey:@"taskStepList"];
    NSMutableArray *stepsMutArr = [NSMutableArray array];
    for (int i = 0; i < steps.count; i++) {
        BWRZQFaBuBuZhouObject *object = [BWRZQFaBuBuZhouObject buzhouItemDic:[steps objectAtIndex:i]];
        [stepsMutArr addObject:object];
    }
    self.stepS = [stepsMutArr sortedArrayUsingComparator:^NSComparisonResult(BWRZQFaBuBuZhouObject *p1, BWRZQFaBuBuZhouObject *p2){
        return [[NSNumber numberWithInteger:p1.index] compare:[NSNumber numberWithInteger:p2.index]];
    }];
    NSString *taskDescription = [dic objectForKey:@"taskDescription"];
    if (taskDescription.length > 0) {
        self.taskDes = taskDescription;
    }else{
        self.taskDes = @"";
    }
    self.readSeconds = [[dic objectForKey:@"readSeconds"] integerValue];
}
@end
