//
//  BDBox.h
//  DropIt
//
//  Created by Amr Lotfy on 8/4/15.
//  Copyright (c) 2015 Amr Lotfy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BDBox : UIView
@property (nonatomic) UIGravityBehavior *gravityDelegate;
@property (nonatomic) UICollisionBehavior *colliderDelegate;


-(void) vanish;

@end
