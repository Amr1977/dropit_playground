//
//  BDBox.m
//  DropIt
//
//  Created by Amr Lotfy on 8/4/15.
//  Copyright (c) 2015 Amr Lotfy. All rights reserved.
//

#import "BDBox.h"

@implementation BDBox

-(void) vanish{
    [self.gravityDelegate removeItem:self];
    [self.colliderDelegate removeItem:self];
    [self removeFromSuperview];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
