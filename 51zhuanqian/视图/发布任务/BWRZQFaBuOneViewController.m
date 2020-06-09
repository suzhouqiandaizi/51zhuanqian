#import "BWRZQFaBuOneViewController.h"
#import "BWRZQFaBuFillInViewController.h"
#import "BWRZQFaBuOneCollectionViewCell.h"
#import "BWRZQFaBuFillInTwoViewController.h"
@interface BWRZQFaBuOneViewController (){
    NSArray             *contentArr;
}
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@end
@implementation BWRZQFaBuOneViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"发布任务-选择分类";
    [self addBackBtn];
    [self configCollectionView];
}
- (void)configCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    CGFloat _margin = 2.5;
    CGFloat _itemWH = (SCREEN_WIDTH_DEVICE - 2 * _margin - 10) / 3 - _margin;
    layout.itemSize = CGSizeMake(_itemWH, _itemWH);
    layout.minimumInteritemSpacing = _margin;
    layout.minimumLineSpacing = _margin;
    [self.collectionView setFrame:CGRectMake(_margin * 3, 64 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE - 2 * _margin, SCREEN_HEIGHT_DEVICE - 64 - IS_iPhoneX_Top)];
    self.collectionView.collectionViewLayout = layout;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.contentInset = UIEdgeInsetsMake(5, 0, 0, 10);
    self.collectionView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    self.collectionView.alwaysBounceVertical = YES;
    [self.collectionView registerClass:[BWRZQFaBuOneCollectionViewCell class] forCellWithReuseIdentifier:@"FaBuOneCell"];
    [self requestContent:YES];
}
- (void)dealloc{
    [[ServiceRequest sharedService] cancelDataTaskForKey:@"task/category/published"];
}
- (void)requestContent:(BOOL)alert{
    if (alert) {
        [self loadingHUDAlert:@"正在加载"];
    }
    [[ServiceRequest sharedService] GET:@"task/category/published" parameters:nil success:^(id responseObject) {
        [self hideHudAlert];
        self->contentArr = responseObject;
        [self.collectionView reloadData];
    } failure:^(NSString *error, NSInteger code) {
        [self hideHudAlert];
        [self showHUDAlert:error];
    }];
}
#pragma mark UICollectionView
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return contentArr.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * CellIdentifier = @"FaBuOneCell";
    BWRZQFaBuOneCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    NSDictionary *dic = [contentArr objectAtIndex:indexPath.row];
    [cell.contentImageView sd_setImageWithURL:[NSURL URLWithString:[dic objectForKey:@"categoryIcon"]]];
    cell.titleLabel.text = [dic objectForKey:@"categoryName"];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic = [contentArr objectAtIndex:indexPath.row];
    BWRZQFaBuFillInTwoViewController *viewCon = [[BWRZQFaBuFillInTwoViewController alloc] initWithNibName:@"BWRZQFaBuFillInTwoViewController" bundle:nil];
    viewCon.taskCategoryStr = [dic objectForKey:@"categoryName"];
    viewCon.serviceFeePercent = [NSString stringWithFormat:@"%@", [dic objectForKey:@"serviceFeePercent"]];
    [self.navigationController pushViewController:viewCon animated:YES];
}
@end
