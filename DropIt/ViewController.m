//
//  ViewController.m
//  DropIt
//
//  Created by Amr Lotfy on 8/4/15.
//  Copyright (c) 2015 Amr Lotfy. All rights reserved.
//

#import "ViewController.h"
#import "BDBox.h"


@interface ViewController ()
@property (nonatomic) UIDynamicAnimator * animator;
@property (nonatomic) UIGravityBehavior *gravity;
@property (nonatomic) UICollisionBehavior *collider;

@end

@implementation ViewController

-(UIGravityBehavior *) gravity{
    if(!_gravity){
        _gravity= [[UIGravityBehavior alloc] init];
    }
    
    return _gravity;
}


-(UICollisionBehavior *) collider{
    if(!_collider){
        _collider= [[UICollisionBehavior alloc] init];
        _collider.translatesReferenceBoundsIntoBoundary=YES;
    }

    return _collider;
}

- (IBAction)tap:(UITapGestureRecognizer *)sender {

    //create a new box at the tap position

    CGPoint tapLocation=[sender locationInView:sender.view];
    NSLog(@"tap detected at: (%f, %f)",tapLocation.x,tapLocation.y);
    CGRect viewRect = CGRectMake(tapLocation.x  , tapLocation.y, 50, 50);
    BDBox * view = [[BDBox alloc] initWithFrame:viewRect];
    view.backgroundColor = [UIColor greenColor];
    
    NSLog(@"installing tap gesture handler for the created view.");
    UITapGestureRecognizer * tapgr = [[UITapGestureRecognizer alloc] initWithTarget:view action:@selector(vanish)];
    view.gravityDelegate=self.gravity;
    view.colliderDelegate=self.collider;
    
    [view addGestureRecognizer:tapgr];
    
    
    NSLog(@"adding a box...");
    [self.view addSubview:view];
    
    NSLog(@"adding behaviors ...");
    [self.gravity addItem:view];
    [self.collider addItem:view];
    [self.animator addBehavior:self.gravity];
    [self.animator addBehavior:self.collider];
    



    
}

-(UIDynamicAnimator *) animator{
    if(! _animator){
       _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    }
    return _animator;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}



@end
