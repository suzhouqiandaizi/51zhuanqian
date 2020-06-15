#import "WYZQTaskClassifyView.h"
#import "WYZQFaBuChooseTypeCollectionViewCell.h"
#import "GlobalFunction.h"
#import "LoadConfig.h"
#import "WYZQTaskClassifyTableViewCell.h"
@interface WYZQTaskClassifyView()<UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource>{
    NSMutableArray      *contentArr;
    NSArray             *contentTableArr;
    NSMutableArray      *chooseArr;
    NSString            *chooseStr;
    NSString            *chooseValueStr;
    BOOL                hasCreateCollectionView;
    BOOL                hasCreateTableView;
    UICollectionReusableView *headerView;
}
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@end
@implementation WYZQTaskClassifyView
- (id)initItem{
    self = [[[NSBundle mainBundle] loadNibNamed:@"WYZQTaskClassifyView" owner:self options:nil] lastObject];
    if (self) {
        [self setFrame:CGRectMake(0, 64 + IS_iPhoneX_Top +35, SCREEN_WIDTH_DEVICE, SCREEN_HEIGHT_DEVICE - 35 - IS_iPhoneX_Top - 64)];
    }
    return self;
}
- (void)showContent:(NSArray *)arr{
    if (self.type == 1) {
        self.collectionView.hidden = NO;
        self.bottomView.hidden = NO;
        self.tableView.hidden = YES;
        if (!hasCreateCollectionView) {
            [self configCollectionView:arr];
        }else{
            CGFloat _margin = 5;
            CGFloat _itemWH = 90;
            NSInteger rowCount = SCREEN_WIDTH_DEVICE/(_itemWH + 2*_margin);
            NSInteger allRow = contentArr.count/rowCount;
            if (contentArr.count%rowCount != 0) {
                allRow++;
            }
            float contentViewHeight = (35 + _margin * 3) * allRow + self.bottomView.frame.size.height + 30 + 20;
            if (contentViewHeight > self.frame.size.height) {
                contentViewHeight = self.frame.size.height;
            }
            [self.contentView setFrame:CGRectMake(0, 0, SCREEN_WIDTH_DEVICE, contentViewHeight)];
            [self.bottomView setFrame:CGRectMake(0, self.contentView.frame.size.height - self.bottomView.frame.size.height, SCREEN_WIDTH_DEVICE, 44)];
            [self.collectionView setFrame:CGRectMake(_margin * 3, 0, SCREEN_WIDTH_DEVICE - 4 * _margin,self.contentView.frame.size.height - self.bottomView.frame.size.height)];
            [self.collectionView reloadData];
        }
    }else{
        self.collectionView.hidden = YES;
        self.bottomView.hidden = YES;
        self.tableView.hidden = NO;
        if (!hasCreateTableView) {
            [self configTableView:arr];
        }else{
            [self.contentView setFrame:CGRectMake(0, 0, SCREEN_WIDTH_DEVICE, 44 * contentTableArr.count)];
            self.tableView.frame = self.contentView.frame;
            [self.tableView reloadData];
        }
    }
}
- (void)configCollectionView:(NSArray *)arr {
    hasCreateCollectionView = YES;
    contentArr = [NSMutableArray array];
    chooseArr = [NSMutableArray array];
    [chooseArr addObjectsFromArray:arr];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    CGFloat _margin = 5;
    CGFloat _itemWH = 90;
    layout.itemSize = CGSizeMake(_itemWH, 35);
    layout.minimumInteritemSpacing = _margin;
    layout.minimumLineSpacing = _margin * 3;
    layout.headerReferenceSize = CGSizeMake(self.collectionView.frame.size.width, 30.0f);
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.collectionViewLayout = layout;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.contentInset = UIEdgeInsetsMake(5, 0, 0, 10);
    self.collectionView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    self.collectionView.alwaysBounceVertical = YES;
    [self.collectionView registerClass:[WYZQFaBuChooseTypeCollectionViewCell class] forCellWithReuseIdentifier:@"FaBuChooseTypeCell"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];  
    NSArray *taskArr = [[LoadConfig shareStance] getTaskHomeCategory];
    for (int i = 0; i < taskArr.count; i++) {
        NSDictionary *taskCategoryDic = [taskArr objectAtIndex:i];
        NSArray *taskCategoryArr = [taskCategoryDic objectForKey:@"componentDtos"];
        if ([[taskCategoryDic objectForKey:@"displayType"] isEqualToString:@"分类"]) {
            for (int j = 0; j < taskCategoryArr.count; j++) {
                NSDictionary *itemDic = [taskCategoryArr objectAtIndex:j];
                [contentArr addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                                       [itemDic objectForKey:@"title"],@"categoryDescription",
                                       [itemDic objectForKey:@"title"],@"categoryName",
                                       @"",@"categoryIcon",
                                       @"1.0",@"serviceFeePercent",nil]];
            }
        }
    }
    [contentArr addObjectsFromArray:[[LoadConfig shareStance] getTaskClassify]];
    [self.collectionView reloadData];
    NSInteger rowCount = SCREEN_WIDTH_DEVICE/(_itemWH + 2*_margin);
    NSInteger allRow = contentArr.count/rowCount;
    if (contentArr.count%rowCount != 0) {
        allRow++;
    }
    float contentViewHeight = (35 + _margin * 3) * allRow + self.bottomView.frame.size.height + 30 + 20;
    if (contentViewHeight > self.frame.size.height) {
        contentViewHeight = self.frame.size.height;
    }
    [self.contentView setFrame:CGRectMake(0, 0, SCREEN_WIDTH_DEVICE, contentViewHeight)];
    [self.bottomView setFrame:CGRectMake(0, self.contentView.frame.size.height - self.bottomView.frame.size.height, SCREEN_WIDTH_DEVICE, 44)];
    [self.collectionView setFrame:CGRectMake(_margin * 3, 0, SCREEN_WIDTH_DEVICE - 4 * _margin,self.contentView.frame.size.height - self.bottomView.frame.size.height)];
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
    [cell.titleBtn setTitle:contentStr forState:UIControlStateNormal];
    cell.isSelected = [chooseArr containsObject:contentStr];
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
        NSString *chooseStr = [dic objectForKey:@"categoryName"];
        if (chooseCell.isSelected) {
            chooseCell.isSelected = NO;
            [self->chooseArr removeObject:chooseStr];
        }else{
            chooseCell.isSelected = YES;
            [self->chooseArr addObject:chooseStr];
        }
        [self.collectionView reloadData];
    };
    return cell;
}
- (UICollectionReusableView *) collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind == UICollectionElementKindSectionHeader) {
        if (!headerView) {
            headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
            UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 25)];
            title.text = @"支持多选";
            title.font = [UIFont systemFontOfSize:14.0f];
            title.textColor = TextGrayColor;
            [headerView addSubview:title];
        }
        return headerView;
    }
    return nil;
}
- (void)configTableView:(NSArray *)arr{
    contentTableArr = [[LoadConfig shareStance] getTaskOptioins];
    chooseArr = [NSMutableArray array];
    [chooseArr addObjectsFromArray:arr];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.contentView setFrame:CGRectMake(0, 0, SCREEN_WIDTH_DEVICE, 44 * contentTableArr.count)];
    self.tableView.frame = self.contentView.frame;
    [self.tableView reloadData];
}
#pragma mark - UITableView datasource methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [contentTableArr count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"TaskClassifyCell";
    WYZQTaskClassifyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"WYZQTaskClassifyTableViewCell" owner:self options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NSString *contentStr = [[contentTableArr objectAtIndex:indexPath.row] objectForKey:@"optionDisplay"];
    [cell.titleBtn setTitle:contentStr forState:UIControlStateNormal];
    cell.isSelected = [contentStr isEqualToString:chooseStr];
    if (cell.isSelected) {
        [cell.titleBtn setTitleColor:ThemeColor forState:UIControlStateNormal];
        [cell.titleBtn setTitleColor:TextColor forState:UIControlStateHighlighted];
    }else{
        [cell.titleBtn setTitleColor:TextColor forState:UIControlStateNormal];
        [cell.titleBtn setTitleColor:ThemeColor forState:UIControlStateHighlighted];
    }
    cell.indexRow = indexPath.row;
    cell.RefreshHandle = ^(WYZQTaskClassifyTableViewCell  *chooseCell) {
        self->chooseStr = [[self->contentTableArr objectAtIndex:chooseCell.indexRow] objectForKey:@"optionDisplay"];
        self->chooseValueStr = [[self->contentTableArr objectAtIndex:chooseCell.indexRow] objectForKey:@"optionValue"];
        chooseCell.isSelected = YES;
        [self.tableView reloadData];
        [self surePress];
    };
    return cell;
}
- (IBAction)removePress {
    if ([self.delegate respondsToSelector:@selector(chooseTaskClassifyView: withSort:withSortValue:)]) {
        [self.delegate chooseTaskClassifyView:chooseArr withSort:chooseStr withSortValue:chooseValueStr];
    }
    if ([self.delegate respondsToSelector:@selector(removeTaskClassifyView)]) {
        [self.delegate removeTaskClassifyView];
    }
    [self removeFromSuperview];
}
- (IBAction)chongzhiPress {
    [chooseArr removeAllObjects];
    [self.collectionView reloadData];
}
- (IBAction)surePress {
    if ([self.delegate respondsToSelector:@selector(chooseTaskClassifyView: withSort:withSortValue:)]) {
        [self.delegate chooseTaskClassifyView:chooseArr withSort:chooseStr withSortValue:chooseValueStr];
    }
    if ([self.delegate respondsToSelector:@selector(removeTaskClassifyView)]) {
        [self.delegate removeTaskClassifyView];
    }
    [self removeFromSuperview];
}
@end
