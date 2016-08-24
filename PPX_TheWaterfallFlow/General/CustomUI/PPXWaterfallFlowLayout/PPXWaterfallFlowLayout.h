//
//  PPXWaterfallFlowLayout.h
//  PPX_TheWaterfallFlow
//
//  Created by pipixia on 16/8/24.
//  Copyright © 2016年 pipixia. All rights reserved.
//

#import <UIKit/UIKit.h>

UIKIT_EXTERN NSString *const UICollectionElementKindSectionHeader;
UIKIT_EXTERN NSString *const UICollectionElementKindSectionFooter;

@class PPXWaterfallFlowLayout;
@protocol PPXWaterfallFlowLayoutDelegate <NSObject>
@required
//item heigh
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(PPXWaterfallFlowLayout*)collectionViewLayout heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath*)indexPath;

@optional
//section header
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(PPXWaterfallFlowLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section;
//section footer
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(PPXWaterfallFlowLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section;
@end

@interface PPXWaterfallFlowLayout : UICollectionViewLayout

@property(nonatomic, assign)UIEdgeInsets sectionInset; //sectionInset
@property(nonatomic, assign)CGFloat lineSpacing;  //line space
@property(nonatomic, assign)CGFloat itemSpacing; //item space
@property(nonatomic, assign)CGFloat colCount; //column count
@property(nonatomic, weak)id<PPXWaterfallFlowLayoutDelegate> delegate;

@end
