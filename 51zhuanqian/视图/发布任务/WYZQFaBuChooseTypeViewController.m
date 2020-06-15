#import "WYZQFaBuChooseTypeViewController.h"
#import "WYZQFaBuFillInViewController.h"
#import "WYZQFaBuChooseTypeCollectionViewCell.h"
#import "WYZQFaBuFillInTwoViewController.h"
#import "GlobalFunction.h"
#import "LoadConfig.h"
@interface WYZQFaBuChooseTypeViewController (){
    NSArray             *contentArr;
}
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@end
@implementation WYZQFaBuChooseTypeViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"选择任务类型";
    [self addBackBtn];
    [self configCollectionView];
}
- (void)configCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    CGFloat _margin = 5;
    CGFloat _itemWH = 90;
    layout.itemSize = CGSizeMake(_itemWH, 35);
    layout.minimumInteritemSpacing = _margin;
    layout.minimumLineSpacing = _margin * 3;
    layout.headerReferenceSize = CGSizeMake(self.collectionView.frame.size.width, 50.0f);
    [self.collectionView setFrame:CGRectMake(_margin * 3, 64 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE - 4 * _margin, SCREEN_HEIGHT_DEVICE - 64 - IS_iPhoneX_Top)];
    self.collectionView.collectionViewLayout = layout;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.contentInset = UIEdgeInsetsMake(5, 0, 0, 10);
    self.collectionView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    self.collectionView.alwaysBounceVertical = YES;
    [self.collectionView registerClass:[WYZQFaBuChooseTypeCollectionViewCell class] forCellWithReuseIdentifier:@"FaBuChooseTypeCell"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];  
    [self requestContent:YES];
}
- (void)dealloc{
}
- (void)requestContent:(BOOL)alert{
    self->contentArr = [[LoadConfig shareStance] getTaskClassify];
    [self.collectionView reloadData];
}
#pragma mark UICollectionView
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return contentArr.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * CellIdentifier = @"FaBuChooseTypeCell";
    WYZQFaBuChooseTypeCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    NSDictionary *dic = [contentArr objectAtIndex:indexPath.row];
    NSString *contentStr = [dic objectForKey:@"categoryDescription"];
    if ([contentStr isEqualToString:self.taskCategoryStr]) {
        cell.isSelected = YES;
    }
    [cell.titleBtn setTitle:contentStr forState:UIControlStateNormal];
    if (cell.isSelected) {
        [cell.titleBtn setTitleColor:ThemeColor forState:UIControlStateNormal];
        [cell.titleBtn setBackgroundColor:RGB(255, 236, 241)];
        [cell.titleBtn setTitleColor:TextColor forState:UIControlStateHighlighted];
        [cell.titleBtn setBackgroundImage:getColorToImage(LineBackgroundColor) forState:UIControlStateHighlighted];
    }else{
        [cell.titleBtn setTitleColor:TextColor forState:UIControlStateNormal];
        [cell.titleBtn setBackgroundColor:LineBackgroundColor];
        [cell.titleBtn setTitleColor:ThemeColor forState:UIControlStateHighlighted];
        [cell.titleBtn setBackgroundImage:getColorToImage(RGB(255, 236, 241)) forState:UIControlStateHighlighted];
    }
    cell.indexRow = indexPath.row;
    cell.RefreshHandle = ^(WYZQFaBuChooseTypeCollectionViewCell  *chooseCell) {
        NSDictionary *dic = [self->contentArr objectAtIndex:chooseCell.indexRow];
        if (self.RefreshHandle) {
            self.RefreshHandle([dic objectForKey:@"categoryName"]);
            [self goBackAction];
        }else{
            WYZQFaBuFillInTwoViewController *viewCon = [[WYZQFaBuFillInTwoViewController alloc] initWithNibName:@"WYZQFaBuFillInTwoViewController" bundle:nil];
            viewCon.taskCategoryStr = [dic objectForKey:@"categoryName"];
            viewCon.serviceFeePercent = [NSString stringWithFormat:@"%@", [dic objectForKey:@"serviceFeePercent"]];
            [self.navigationController pushViewController:viewCon animated:YES];
        }
    };
    return cell;
}
- (UICollectionReusableView *) collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 50)];
        title.text = @"请正确选择以下分类，否则会被拒审";
        title.font = [UIFont systemFontOfSize:14.0f];
        title.textColor = TextGrayColor;
        [headerView addSubview:title];
        return headerView;
    }
    return nil;
}
@end
