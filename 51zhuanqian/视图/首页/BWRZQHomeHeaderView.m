#import "BWRZQHomeHeaderView.h"
#import "AppDelegate.h"
#import "BWRZQXinShouViewController.h"
#import "BWRZQWebShowViewController.h"
#import "LoadConfig.h"
#import "BWRZQHomeTaskOneView.h"
#import "BWRZQHomeTaskTwoView.h"
#import "BWRZQHomeTaskThreeView.h"
#import "GlobalFunction.h"
#import "BWRZQTaskDetailTwoViewController.h"
#import "BWRZQSingleTaskViewController.h"
@interface BWRZQHomeHeaderView()<SDCycleScrollViewDelegate>{
    NSArray             *bannerArr;
}
@end
@implementation BWRZQHomeHeaderView
- (id)initItem{
    self = [[[NSBundle mainBundle] loadNibNamed:@"BWRZQHomeHeaderView" owner:self options:nil] lastObject];
    if (self) {
        self.bannerView.delegate = self;
        self.bannerView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
        self.bannerView.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.bannerView.autoScrollTimeInterval = 4.0;
        self.bannerView.hidesForSinglePage = YES;
        self.bannerView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
        self.bannerView.showPageControl = NO;
        float bannerHeight = 125 * SCREEN_SCALE;
        [self.bannerView setFrame:CGRectMake(0, 0, SCREEN_WIDTH_DEVICE, bannerHeight)];
        NSArray *taskArr = [[LoadConfig shareStance] getTaskHomeCategory];
        float viewOriginY = bannerHeight + 20;
        for (int i = 0; i < taskArr.count; i++) {
            NSDictionary *taskCategoryDic = [taskArr objectAtIndex:i];
            UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, viewOriginY, 200, 20)];
            titleLabel.text = [taskCategoryDic objectForKey:@"componentName"];
            titleLabel.textColor = TextColor;
            titleLabel.font = [UIFont systemFontOfSize:16.0f];
            [self addSubview:titleLabel];
            viewOriginY = viewOriginY + titleLabel.frame.size.height + 10;
            NSArray *taskCategoryArr = [taskCategoryDic objectForKey:@"componentDtos"];
            if ([[taskCategoryDic objectForKey:@"displayType"] isEqualToString:@"分类"]) {
                float taskOneViewWidth = (SCREEN_WIDTH_DEVICE - 45)/2.0;
                float taskOneViewOriginX = 15;
                for (int j = 0; j < taskCategoryArr.count; j++) {
                    if (j % 2 != 0) {
                        taskOneViewOriginX = taskOneViewWidth + 30;
                    }else{
                        taskOneViewOriginX = 15;
                    }
                    if (j > 0 && j % 2 == 0) {
                        viewOriginY = viewOriginY + 77 + 15;
                    }
                    BWRZQHomeTaskOneView *taskOneView = [[BWRZQHomeTaskOneView alloc] initItem:CGRectMake(taskOneViewOriginX, viewOriginY, taskOneViewWidth, 77)];
                    taskOneView.currentNum = j;
                    [taskOneView showContent:[taskCategoryArr objectAtIndex:j]];
                    [self addSubview:taskOneView];
                    addShadowToView(taskOneView, 0.3, 5.0f, 5.0f);
                }
                viewOriginY = viewOriginY + 77 + 15 + 10;
            }else if([[taskCategoryDic objectForKey:@"displayType"] isEqualToString:@"类型"]){
                float taskTwoViewWidth = (SCREEN_WIDTH_DEVICE - 60)/3.0;
                float taskTwoViewOriginX = 15;
                for (int j = 0; j < taskCategoryArr.count; j++) {
                    if (j % 3 != 0) {
                        taskTwoViewOriginX = taskTwoViewOriginX + taskTwoViewWidth + 15;
                    }else{
                        taskTwoViewOriginX = 15;
                    }
                    if (j > 0 && j % 3 == 0) {
                        viewOriginY = viewOriginY + 112 + 15;
                    }
                    BWRZQHomeTaskTwoView *taskTwoView = [[BWRZQHomeTaskTwoView alloc] initItem:CGRectMake(taskTwoViewOriginX, viewOriginY, taskTwoViewWidth, 112)];
                    [taskTwoView showContent:[taskCategoryArr objectAtIndex:j]];
                    [self addSubview:taskTwoView];
                    taskTwoView.thirdpartyKeyHandle = ^(NSString * _Nonnull key) {
                        if (self.thirdpartyKeyHandle) {
                            self.thirdpartyKeyHandle(key);
                        }
                    };
                    addShadowToView(taskTwoView, 0.3, 5.0f, 5.0f);
                }
                viewOriginY = viewOriginY + 112 + 15 + 10;
            }else{
                float taskOneViewWidth = (SCREEN_WIDTH_DEVICE - 45)/2.0;
                float taskOneViewOriginX = 15;
                for (int j = 0; j < taskCategoryArr.count; j++) {
                    if (j % 2 != 0) {
                        taskOneViewOriginX = taskOneViewWidth + 30;
                    }else{
                        taskOneViewOriginX = 15;
                    }
                    if (j > 0 && j % 2 == 0) {
                        viewOriginY = viewOriginY + 60 + 15;
                    }
                    BWRZQHomeTaskThreeView *taskThreeView = [[BWRZQHomeTaskThreeView alloc] initItem:CGRectMake(taskOneViewOriginX, viewOriginY, taskOneViewWidth, 60)];
                    [taskThreeView showContent:[taskCategoryArr objectAtIndex:j]];
                    [self addSubview:taskThreeView];
                    addShadowToView(taskThreeView, 0.3, 5.0f, 5.0f);
                }
                viewOriginY = viewOriginY + 60 + 15 + 10;
            }
        }
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, viewOriginY, 200, 20)];
        titleLabel.text = @"推荐任务";
        titleLabel.textColor = TextColor;
        titleLabel.font = [UIFont systemFontOfSize:16.0f];
        [self addSubview:titleLabel];
        UIButton *moreBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH_DEVICE - 50 - 8, viewOriginY - 8, 50, 40)];
        [moreBtn addTarget:self action:@selector(morePress) forControlEvents:UIControlEventTouchUpInside];
        moreBtn.titleLabel.font = [UIFont systemFontOfSize:15.0f];
        [moreBtn setTitle:@"更多" forState:UIControlStateNormal];
        [moreBtn setTitleColor:TextGrayColor forState:UIControlStateNormal];
        [moreBtn setImage:[UIImage imageNamed:@"renwu_more_btn"] forState:UIControlStateNormal];
        [moreBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -
         moreBtn.imageView.frame.size.width, 0, moreBtn.imageView.frame.size.width)];
        [moreBtn setImageEdgeInsets:UIEdgeInsetsMake(0, moreBtn.titleLabel.bounds.size.width, 0, - moreBtn.titleLabel.bounds.size.width - 5)];
        [self addSubview:moreBtn];
        viewOriginY = viewOriginY + 20 + 10;
        [self setFrame:CGRectMake(0, 0, SCREEN_WIDTH_DEVICE, viewOriginY)];
    }
    return self;
}
- (void)morePress{
    AppDelegate *del = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    BWRZQSingleTaskViewController *viewCon = [[BWRZQSingleTaskViewController alloc] initWithNibName:@"BWRZQSingleTaskViewController" bundle:nil];
    [del.navigationController pushViewController:viewCon animated:YES];
}
- (IBAction)twoBtnPress {
    AppDelegate *del = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    BWRZQWebShowViewController *viewCon = [[BWRZQWebShowViewController alloc] initWithNibName:@"BWRZQWebShowViewController" bundle:nil];
    viewCon.urlStr = [NSString stringWithFormat:@"%@/app_51zhuanqian/xinshougonglve.html", HOSTURL];
    [del.navigationController pushViewController:viewCon animated:YES];
}
- (void)setBanners:(NSArray *)arr{
    if (arr.count > 0) {
        bannerArr = arr;
        NSMutableArray *banners = [NSMutableArray array];
        for (int i = 0; i < arr.count; i++) {
            [banners addObject:[[arr objectAtIndex:i] objectForKey:@"bannerImage"]];
        }
        self.bannerView.hidden = NO;
        self.bannerView.imageURLStringsGroup = banners;
    }else{
    }
}
#pragma mark - SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"点击了第%ld广告", index + 1);
    NSDictionary *contentDic = [bannerArr objectAtIndex:index];
    NSString *type = [contentDic objectForKey:@"type"];
    if ([type isEqualToString:@"TASK"]) {
        NSString *taskNo = [contentDic objectForKey:@"referenceId"];
        BWRZQTaskDetailTwoViewController *viewCon = [[BWRZQTaskDetailTwoViewController alloc] initWithNibName:@"BWRZQTaskDetailTwoViewController" bundle:nil];
        viewCon.taskId = taskNo;
        AppDelegate *del = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        [del.navigationController pushViewController:viewCon animated:YES];
    }else{
        NSString *url = [contentDic objectForKey:@"url"];
        if (url.length > 0) {
            BWRZQWebShowViewController *viewCon = [[BWRZQWebShowViewController alloc] initWithNibName:@"BWRZQWebShowViewController" bundle:nil];
            viewCon.urlStr = url;
            AppDelegate *del = (AppDelegate*)[[UIApplication sharedApplication] delegate];
            [del.navigationController pushViewController:viewCon animated:YES];
        }
    }
}
@end
