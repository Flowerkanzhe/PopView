//
//  ViewController.m
//  PopView
//
//  Created by woqugame on 2018/5/16.
//  Copyright © 2018年 FlowerKanZhe. All rights reserved.
//

#import "ViewController.h"
#import "KVPopView.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)touch:(UIButton *)sender {
    
    UIView *content = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    content.backgroundColor = [UIColor whiteColor];
    
    KVPopView *popView = [[KVPopView alloc] init];
    popView.content = content;
    [popView showFromView:sender vAlignStyle:KVVAlignStyleBottom hAlignStyle:KVHAlignStyleCenter];
}

- (IBAction)foo3:(id)sender {
    UIView *content = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 510)];
    content.backgroundColor = [UIColor whiteColor];
    
    KVPopView *popView = [[KVPopView alloc] init];
    popView.content = content;
    [popView showFromView:sender vAlignStyle:KVVAlignStyleBottom hAlignStyle:KVHAlignStyleCenter];
}

- (IBAction)foo4:(id)sender {
    UIView *content = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 290, 100)];
    content.backgroundColor = [UIColor whiteColor];
    
    KVPopView *popView = [[KVPopView alloc] init];
    popView.content = content;
    [popView showFromView:sender vAlignStyle:KVVAlignStyleBottom hAlignStyle:KVHAlignStyleCenter];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UIView *content = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    content.backgroundColor = [UIColor whiteColor];
    
    KVPopView *popView = [[KVPopView alloc] init];
    popView.content = content;
    CGPoint point = [[touches anyObject] locationInView:self.view];
    NSLog(@"%@", NSStringFromCGPoint(point));
    [popView showFromPoint:point vAlignStyle:KVVAlignStyleTop hAlignStyle:KVHAlignStyleCenter];
}

@end
