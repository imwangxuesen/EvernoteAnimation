//
//  EvernoteCollectionCell.m
//  EvernoteAnimation
//
//  Created by WangXuesen on 16/7/14.
//  Copyright © 2016年 Jsen. All rights reserved.
//

#import "EvernoteCollectionCell.h"

@implementation EvernoteCollectionCell



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
        self.layer.masksToBounds = YES;
        
        self.layer.cornerRadius = 7;
    }
    return self;
}




- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 7;
    }
    return self;
}


@end
