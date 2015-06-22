//
//  ViewController.m
//  Animation-Gravity-Practice
//
//  Created by TsujiTomoya on 2015/06/22.
//  Copyright (c) 2015年 astrotom. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) UIDynamicAnimator *animator;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //アニメーションさせるビュー（赤い四角）を作成する
    UIView *myView = [[UIView alloc] initWithFrame:CGRectMake(110, 0, 100, 100)];
    myView.backgroundColor = [UIColor redColor];
    [self.view addSubview:myView];
    
    //UIDynamicAnimatorの作成
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    //重力を司るもの
    UIGravityBehavior* gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[myView]];
    [self.animator addBehavior:gravityBehavior];
    
    //衝突を司るもの
    UICollisionBehavior* collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[myView]];
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    [self.animator addBehavior:collisionBehavior];
    
    //バウンス
    UIDynamicItemBehavior *elasticityBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[myView]];
    elasticityBehavior.elasticity = 1.0f;
    [self.animator addBehavior:elasticityBehavior];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
