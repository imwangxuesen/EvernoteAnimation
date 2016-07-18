//
//  EvernoteDetailController.h
//  EvernoteAnimation
//
//  Created by WangXuesen on 16/7/14.
//  Copyright © 2016年 Jsen. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol EvernoteDetailControllerDelegate <NSObject>

- (void)detailGoBack;

@end

@interface EvernoteDetailController : UIViewController

@property (nonatomic ,weak) id<EvernoteDetailControllerDelegate>delegate;
@end
