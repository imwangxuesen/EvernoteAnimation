//
//  EvernoteCollectionController.m
//  EvernoteAnimation
//
//  Created by WangXuesen on 16/7/14.
//  Copyright © 2016年 Jsen. All rights reserved.
//

#import "EvernoteCollectionController.h"
#import "EvernoteDetailController.h"
#import "EvernoteCollectionCell.h"
#import "EvernoteFlowLayout.h"
#import "EvernoteTransition.h"

@interface EvernoteCollectionController() <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic , strong) NSMutableArray * dataSource;

@property (nonatomic , strong) EvernoteTransition * transition;

@end

@implementation EvernoteCollectionController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor grayColor];
    self.collectionView.collectionViewLayout = [[EvernoteFlowLayout alloc] init];

    [self.collectionView registerClass:[EvernoteCollectionCell class] forCellWithReuseIdentifier:NSStringFromClass([EvernoteCollectionCell class])];

}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return self.dataSource.count;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 1;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([EvernoteCollectionCell class]) forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor purpleColor];
    EvernoteCollectionCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([EvernoteCollectionCell class]) forIndexPath:indexPath];
    cell.tag = indexPath.section;
    
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    EvernoteCollectionCell * selectedCell = (EvernoteCollectionCell *)[collectionView cellForItemAtIndexPath:indexPath];
    NSArray * visibleCells = collectionView.visibleCells;
    UIStoryboard * stb  = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    EvernoteDetailController * VC = [stb instantiateViewControllerWithIdentifier:@"EvernoteDetailController"];
    CGRect finalFrame = CGRectMake(10, collectionView.contentOffset.y + 30,  ScreenW- 20, ScreenH - 40);
    [self.transition evernoteTransitionWithSelectCell:selectedCell visibleCells:visibleCells originFrame:selectedCell.frame finalFrame:finalFrame panViewController:VC listViewController:self];
    VC.transitioningDelegate = self.transition;
    VC.delegate = self.transition;
    [self presentViewController:VC animated:YES completion:^{
        
    }];

}

#pragma mark - getter
- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc] init];
        for (int i = 0; i< 20; i++) {
            [_dataSource addObject:[NSString stringWithFormat:@"Evernote%d",i]];
        }
    }
    return _dataSource;
}

- (EvernoteTransition *)transition {
    if (!_transition) {
        _transition = [[EvernoteTransition alloc] init];
    }
    return _transition;
}
@end
