//
//  WaterfallFlowViewController.m
//  PPX_TheWaterfallFlow
//
//  Created by pipixia on 16/8/24.
//  Copyright © 2016年 pipixia. All rights reserved.
//

#import "WaterfallFlowViewController.h"
#import "CollectionViewCell.h"
#import "CollectionHeaderOrFooterView.h"
#import "PPXWaterfallFlowLayout.h"

static NSString *collectionHeader = @"CollectionHeader";
static NSString *collectionFooter = @"CollectionFooter";

@interface WaterfallFlowViewController ()
<UICollectionViewDelegate,
UICollectionViewDataSource,
PPXWaterfallFlowLayoutDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation WaterfallFlowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"PPX Waterfall flow";
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self configCollectionView];
    
}
#pragma mark - UICollectionView alloc

- (void)configCollectionView
{
    PPXWaterfallFlowLayout *ppxWaterfallFlowLayout = [[PPXWaterfallFlowLayout alloc] init];
    ppxWaterfallFlowLayout.itemSpacing = 10;
    ppxWaterfallFlowLayout.lineSpacing = 10;
    ppxWaterfallFlowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    ppxWaterfallFlowLayout.colCount = 3;
    ppxWaterfallFlowLayout.delegate = self;
    
    self.collectionView  = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) collectionViewLayout:ppxWaterfallFlowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.collectionView];
    
    [self.collectionView registerClass:[CollectionHeaderOrFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader  withReuseIdentifier:collectionHeader];
    [self.collectionView registerClass:[CollectionHeaderOrFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter  withReuseIdentifier:collectionFooter];

    
    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"CollectionViewCell"];

}
#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 100;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString * CellIdentifier = [NSString stringWithFormat:@"CollectionViewCell"];
    
    CollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor brownColor];
    
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击itme:%ld",(long)indexPath.row);
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        CollectionHeaderOrFooterView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:collectionHeader forIndexPath:indexPath];
        headerView.backgroundColor = [UIColor redColor];
        return headerView;
    }else{
        CollectionHeaderOrFooterView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:collectionFooter forIndexPath:indexPath];
        footerView.backgroundColor = [UIColor purpleColor];
        return footerView;
    }
}

#pragma mark PPXWaterfallFlowLayoutDelegate
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(PPXWaterfallFlowLayout*)collectionViewLayout heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath*)indexPath
{
    if (indexPath.row%2 == 0) {
        return 100;
    }else{
        return 160;
    }
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(PPXWaterfallFlowLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    CGSize size={self.view.bounds.size.width-20,50};
    
    return size;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(PPXWaterfallFlowLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    CGSize size={self.view.bounds.size.width-20,150};
    
    return size;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
