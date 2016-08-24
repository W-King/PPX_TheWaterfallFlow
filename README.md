# PPX_TheWaterfallFlow
使用方法:
1,引入头文件 #import "PPXWaterfallFlowLayout.h"
2.设置代理 PPXWaterfallFlowLayoutDelegate
3, PPXWaterfallFlowLayout *ppxWaterfallFlowLayout = [[PPXWaterfallFlowLayout alloc] init];
    ppxWaterfallFlowLayout.itemSpacing = 10;
    ppxWaterfallFlowLayout.lineSpacing = 10;
    ppxWaterfallFlowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    ppxWaterfallFlowLayout.colCount = 3;
    ppxWaterfallFlowLayout.delegate = self;
    collectionViewLayout 设置为 ppxWaterfallFlowLayout
3,- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(PPXWaterfallFlowLayout*)collectionViewLayout heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath*)indexPath
返回高度
4,- (CGSize)collectionView:(UICollectionView *)collectionView layout:(PPXWaterfallFlowLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
head高度
5- (CGSize)collectionView:(UICollectionView *)collectionView layout:(PPXWaterfallFlowLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
foot 高度
