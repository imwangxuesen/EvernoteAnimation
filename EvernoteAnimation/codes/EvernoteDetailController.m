//
//  EvernoteDetailController.m
//  EvernoteAnimation
//
//  Created by WangXuesen on 16/7/14.
//  Copyright © 2016年 Jsen. All rights reserved.
//

#import "EvernoteDetailController.h"

@interface EvernoteDetailController()

@property (strong, nonatomic) UIView *backGroundView;



@end

@implementation EvernoteDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor grayColor]];
    self.backGroundView.layer.masksToBounds = YES;
    self.backGroundView.layer.cornerRadius = 7;
    self.backGroundView.userInteractionEnabled = YES;
    
    
}


@end
