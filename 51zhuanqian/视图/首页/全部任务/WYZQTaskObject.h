#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, TaskType) {
    TaskType_dailingqu        = 0, 
    TaskType_daitijiao        = 1, 
    TaskType_shenhezhong      = 2, 
    TaskType_yijiangli_no     = 3, 
    TaskType_yijiangli_yes    = 4, 
    TaskType_shenheshibai     = 5, 
};
NS_ASSUME_NONNULL_BEGIN
@interface WYZQTaskObject : NSObject
+(instancetype)taskItemDic:(NSDictionary *)dic;
+(instancetype)taskDetailDic:(NSDictionary *)dic;
@property (nonatomic, assign) TaskType type;
@property (nonatomic, strong) NSString *taskId;
@property (nonatomic, strong) NSString *orderId;
@property (nonatomic, strong) NSString *iconUrl;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *approvedUserCount;
@property (nonatomic, strong) NSString *leftBidTime;
@property (nonatomic, strong) NSString *rewardAmountDisplay;
@property (nonatomic, assign) BOOL allowToBidFlag;
@property (strong, nonatomic) NSArray *approveUserVartarsArr;
@property (nonatomic, strong) NSString *bidSubmitDurationHours;
@property (nonatomic, strong) NSString *endTimeDisplay;
@property (nonatomic, strong) NSString *publisherName;
@property (nonatomic, strong) NSString *publisherPlatformId;
@property (nonatomic, strong) NSString *publisherVartar;
@property (nonatomic, strong) NSString *taskCategory;
@property (nonatomic, strong) NSString *taskLinks;
@property (nonatomic, strong) NSString *taskRequirement;
@property (nonatomic, strong) NSArray *taskRequirementImages;
@property (nonatomic, strong) NSString *taskSteps;
@property (nonatomic, strong) NSArray *taskStepImages;
@property (nonatomic, strong) NSString *taskType;
@property (nonatomic, strong) NSString *bidTimesByUser;
@property (nonatomic, strong) NSString *thirdpartyKeyStr;
@property (strong, nonatomic) NSArray *iconArr;
@property (assign, nonatomic) BOOL zidailiulangqi;
@property (nonatomic, strong) NSArray *stepS;
@property (nonatomic, strong) NSString *taskDes;
@property (nonatomic, strong) NSString *taskStatusUrl;
@property (nonatomic, assign) NSInteger readSeconds;
@end
NS_ASSUME_NONNULL_END
