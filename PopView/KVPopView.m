//
//  KVPopView.m
//  PopView
//
//  Created by woqugame on 2018/5/16.
//  Copyright © 2018年 FlowerKanZhe. All rights reserved.
//

#import "KVPopView.h"

@implementation KVPopViewConfiguration
- (instancetype)init
{
    self = [super init];
    if (self) {
        _shouldDismissOnTouchOutside = YES;
        _isNeedAnimate = YES;
    }
    return self;
}
@end


@interface KVPopViewContainerView : UIView
@property (nonatomic, strong) CAShapeLayer *popLayer;
@property (nonatomic, strong) UIColor *layerColor;
@property (nonatomic, strong) KVPopViewConfiguration *config;
@end

@implementation KVPopViewContainerView

- (instancetype)initWithConfig:(KVPopViewConfiguration *)config
{
    self = [super init];
    if (self) {
        _config = config;
        _popLayer = [[CAShapeLayer alloc] init];
        [self.layer addSublayer:_popLayer];
    }
    return self;
}

- (void)setLayerWithVAlignStyle:(KVVAlignStyle)vStyle vOffset:(CGFloat)vOffset hAlignStyle:(KVHAlignStyle)hStyle hOffset:(CGFloat)hOffset
{
    CGFloat w = self.frame.size.width;
    CGFloat h = self.frame.size.height;
    CGFloat triAngH = _config.triAngelHeight;
    CGFloat triAngW = _config.triAngelWidth;
    CGFloat corRad = _config.containerViewCornerRadius;
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    if (vStyle == KVVAlignStyleTop) {
        
        if (hStyle == KVHAlignStyleLeft) {
            
            CGPoint point0 = CGPointMake(w - triAngH, h - corRad - triAngW);
            CGPoint point1 = CGPointMake(w, h - corRad - triAngW * 0.5);
            CGPoint point2 = CGPointMake(w - triAngH, h - corRad);
            CGPoint point2_C = CGPointMake(w - triAngH - corRad, h - corRad);
            CGPoint point3 = CGPointMake(corRad, h);
            CGPoint point3_C = CGPointMake(corRad, h - corRad);
            CGPoint point4 = CGPointMake(0, corRad);
            CGPoint point4_C = CGPointMake(corRad, corRad);
            CGPoint point5 = CGPointMake(w - triAngH - corRad, 0);
            CGPoint point5_C = CGPointMake(w - triAngH - corRad, corRad);
            
            [path moveToPoint:point0];
            [path addLineToPoint:point1];
            [path addLineToPoint:point2];
            [path addArcWithCenter:point2_C radius:corRad startAngle:0 endAngle:M_PI * 0.5 clockwise:YES];
            [path addLineToPoint:point3];
            [path addArcWithCenter:point3_C radius:corRad startAngle:M_PI * 0.5 endAngle:M_PI clockwise:YES];
            [path addLineToPoint:point4];
            [path addArcWithCenter:point4_C radius:corRad startAngle:M_PI endAngle:M_PI + M_PI_2 clockwise:YES];
            [path addLineToPoint:point5];
            [path addArcWithCenter:point5_C radius:corRad startAngle:M_PI + M_PI_2 endAngle:M_PI * 2 clockwise:YES];
            
        } else if (hStyle == KVHAlignStyleRight) {
            
            CGPoint point0 = CGPointMake(triAngH, h - corRad - triAngW);
            CGPoint point1 = CGPointMake(0, h - corRad - triAngW * 0.5);
            CGPoint point2 = CGPointMake(triAngH, h - corRad);
            CGPoint point2_C = CGPointMake(triAngH + corRad, h - corRad);
            CGPoint point3 = CGPointMake(w - corRad, h);
            CGPoint point3_C = CGPointMake(w - corRad, h - corRad);
            CGPoint point4 = CGPointMake(w, corRad);
            CGPoint point4_C = CGPointMake(w - corRad, corRad);
            CGPoint point5 = CGPointMake(triAngH + corRad, 0);
            CGPoint point5_C = CGPointMake(triAngH + corRad, corRad);
            
            [path moveToPoint:point0];
            [path addLineToPoint:point1];
            [path addLineToPoint:point2];
            [path addArcWithCenter:point2_C radius:corRad startAngle:M_PI endAngle:M_PI * 0.5 clockwise:NO];
            [path addLineToPoint:point3];
            [path addArcWithCenter:point3_C radius:corRad startAngle:M_PI * 0.5 endAngle:0 clockwise:NO];
            [path addLineToPoint:point4];
            [path addArcWithCenter:point4_C radius:corRad startAngle:0 endAngle:M_PI + M_PI_2 clockwise:NO];
            [path addLineToPoint:point5];
            [path addArcWithCenter:point5_C radius:corRad startAngle:M_PI + M_PI_2 endAngle:M_PI clockwise:NO];
            
        } else if (hStyle == KVHAlignStyleCenter) {
            
            CGPoint point0 = CGPointMake((w - triAngW) * 0.5 - hOffset, h - triAngH);
            CGPoint point1 = CGPointMake(w * 0.5 - hOffset, h);
            CGPoint point2 = CGPointMake((w + triAngW) * 0.5 - hOffset, h - triAngH);
            CGPoint point3 = CGPointMake(w - corRad, h - triAngH);
            CGPoint point3_C = CGPointMake(w - corRad, h - triAngH - corRad);
            CGPoint point4 = CGPointMake(w, corRad);
            CGPoint point4_C = CGPointMake(w - corRad, corRad);
            CGPoint point5 = CGPointMake(corRad, 0);
            CGPoint point5_C = CGPointMake(corRad, corRad);
            CGPoint point6 = CGPointMake(0, h - corRad - triAngH);
            CGPoint point6_C = CGPointMake(corRad, h - corRad - triAngH);
            
            [path moveToPoint:point0];
            [path addLineToPoint:point1];
            [path addLineToPoint:point2];
            [path addLineToPoint:point3];
            [path addArcWithCenter:point3_C radius:corRad startAngle:M_PI_2 endAngle:0 clockwise:NO];
            [path addLineToPoint:point4];
            [path addArcWithCenter:point4_C radius:corRad startAngle:0 endAngle:M_PI + M_PI_2 clockwise:NO];
            [path addLineToPoint:point5];
            [path addArcWithCenter:point5_C radius:corRad startAngle:M_PI + M_PI_2 endAngle:M_PI clockwise:NO];
            [path addLineToPoint:point6];
            [path addArcWithCenter:point6_C radius:corRad startAngle:M_PI endAngle:M_PI_2 clockwise:NO];
        }
        
    } else if (vStyle == KVVAlignStyleBottom) {
        
        if (hStyle == KVHAlignStyleLeft) {
            
            CGPoint point0 = CGPointMake(w - triAngH, corRad + triAngW);
            CGPoint point1 = CGPointMake(w, corRad + triAngW * 0.5);
            CGPoint point2 = CGPointMake(w - triAngH, corRad);
            CGPoint point2_C = CGPointMake(w - triAngH - corRad, corRad);
            CGPoint point3 = CGPointMake(corRad, 0);
            CGPoint point3_C = CGPointMake(corRad, corRad);
            CGPoint point4 = CGPointMake(0, h - corRad);
            CGPoint point4_C = CGPointMake(corRad, h - corRad);
            CGPoint point5 = CGPointMake(w - corRad - triAngH, h);
            CGPoint point5_C = CGPointMake(w - corRad - triAngH, h - corRad);
            
            [path moveToPoint:point0];
            [path addLineToPoint:point1];
            [path addLineToPoint:point2];
            [path addArcWithCenter:point2_C radius:corRad startAngle:M_PI * 2 endAngle:M_PI + M_PI_2 clockwise:NO];
            [path addLineToPoint:point3];
            [path addArcWithCenter:point3_C radius:corRad startAngle:M_PI + M_PI_2 endAngle:M_PI clockwise:NO];
            [path addLineToPoint:point4];
            [path addArcWithCenter:point4_C radius:corRad startAngle:M_PI endAngle:M_PI_2 clockwise:NO];
            [path addLineToPoint:point5];
            [path addArcWithCenter:point5_C radius:corRad startAngle:M_PI_2 endAngle:0 clockwise:NO];
            
        } else if (hStyle == KVHAlignStyleRight) {
            
            CGPoint point0 = CGPointMake(triAngH, corRad + triAngW);
            CGPoint point1 = CGPointMake(0, corRad + triAngW * 0.5);
            CGPoint point2 = CGPointMake(triAngH, corRad);
            CGPoint point2_C = CGPointMake(triAngH + corRad, corRad);
            CGPoint point3 = CGPointMake(w - corRad, 0);
            CGPoint point3_C = CGPointMake(w - corRad, corRad);
            CGPoint point4 = CGPointMake(w, h - corRad);
            CGPoint point4_C = CGPointMake(w - corRad, h - corRad);
            CGPoint point5 = CGPointMake(corRad + triAngH, h);
            CGPoint point5_C = CGPointMake(corRad + triAngH, h - corRad);
            
            [path moveToPoint:point0];
            [path addLineToPoint:point1];
            [path addLineToPoint:point2];
            [path addArcWithCenter:point2_C radius:corRad startAngle:M_PI endAngle:M_PI + M_PI_2 clockwise:YES];
            [path addLineToPoint:point3];
            [path addArcWithCenter:point3_C radius:corRad startAngle:M_PI + M_PI_2 endAngle:0 clockwise:YES];
            [path addLineToPoint:point4];
            [path addArcWithCenter:point4_C radius:corRad startAngle:0 endAngle:M_PI_2 clockwise:YES];
            [path addLineToPoint:point5];
            [path addArcWithCenter:point5_C radius:corRad startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
            
        } else if (hStyle == KVHAlignStyleCenter) {
            
            CGPoint point0 = CGPointMake((w - triAngW) * 0.5 - hOffset, triAngH);
            CGPoint point1 = CGPointMake(w * 0.5 - hOffset, 0);
            CGPoint point2 = CGPointMake((w + triAngW) * 0.5 - hOffset, triAngH);
            CGPoint point3 = CGPointMake(w - corRad, triAngH);
            CGPoint point3_C = CGPointMake(w - corRad, triAngH + corRad);
            CGPoint point4 = CGPointMake(w, h - corRad);
            CGPoint point4_C = CGPointMake(w - corRad, h - corRad);
            CGPoint point5 = CGPointMake(corRad, h);
            CGPoint point5_C = CGPointMake(corRad, h - corRad);
            CGPoint point6 = CGPointMake(0, corRad + triAngH);
            CGPoint point6_C = CGPointMake(corRad, corRad + triAngH);
            
            [path moveToPoint:point0];
            [path addLineToPoint:point1];
            [path addLineToPoint:point2];
            [path addLineToPoint:point3];
            [path addArcWithCenter:point3_C radius:corRad startAngle:M_PI + M_PI_2 endAngle:0 clockwise:YES];
            [path addLineToPoint:point4];
            [path addArcWithCenter:point4_C radius:corRad startAngle:0 endAngle:M_PI_2 clockwise:YES];
            [path addLineToPoint:point5];
            [path addArcWithCenter:point5_C radius:corRad startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
            [path addLineToPoint:point6];
            [path addArcWithCenter:point6_C radius:corRad startAngle:M_PI endAngle:M_PI + M_PI_2 clockwise:YES];
        }
    } else {
        
        if (hStyle == KVHAlignStyleLeft) {
            
            CGPoint point0 = CGPointMake(w - triAngH, (h - triAngW) * 0.5 - vOffset);
            CGPoint point1 = CGPointMake(w, h * 0.5 - vOffset);
            CGPoint point2 = CGPointMake(w - triAngH, (h + triAngW) * 0.5 - vOffset);
            CGPoint pointA = CGPointMake(w - triAngH, h - corRad);
            CGPoint point2_C = CGPointMake(w - triAngH - corRad, h - corRad);
            CGPoint point3 = CGPointMake(corRad, h);
            CGPoint point3_C = CGPointMake(corRad, h - corRad);
            CGPoint point4 = CGPointMake(0, corRad);
            CGPoint point4_C = CGPointMake(corRad, corRad);
            CGPoint point5 = CGPointMake(w - triAngH - corRad, 0);
            CGPoint point5_C = CGPointMake(w - triAngH - corRad, corRad);
            
            [path moveToPoint:point0];
            [path addLineToPoint:point1];
            [path addLineToPoint:point2];
            [path addLineToPoint:pointA];
            [path addArcWithCenter:point2_C radius:corRad startAngle:0 endAngle:M_PI * 0.5 clockwise:YES];
            [path addLineToPoint:point3];
            [path addArcWithCenter:point3_C radius:corRad startAngle:M_PI * 0.5 endAngle:M_PI clockwise:YES];
            [path addLineToPoint:point4];
            [path addArcWithCenter:point4_C radius:corRad startAngle:M_PI endAngle:M_PI + M_PI_2 clockwise:YES];
            [path addLineToPoint:point5];
            [path addArcWithCenter:point5_C radius:corRad startAngle:M_PI + M_PI_2 endAngle:M_PI * 2 clockwise:YES];
            
        } else if (hStyle == KVHAlignStyleRight) {
            
            CGPoint point0 = CGPointMake(triAngH, (h - triAngW) * 0.5 - vOffset);
            CGPoint point1 = CGPointMake(0, h * 0.5 - vOffset);
            CGPoint point2 = CGPointMake(triAngH, (h + triAngW) * 0.5 - vOffset);
            CGPoint pointA = CGPointMake(triAngH, h - corRad - vOffset);
            CGPoint point2_C = CGPointMake(triAngH + corRad, h - corRad - vOffset);
            CGPoint point3 = CGPointMake(w - corRad, h - vOffset);
            CGPoint point3_C = CGPointMake(w - corRad, h - corRad - vOffset);
            CGPoint point4 = CGPointMake(w, corRad);
            CGPoint point4_C = CGPointMake(w - corRad, corRad - vOffset);
            CGPoint point5 = CGPointMake(triAngH + corRad, 0 - vOffset);
            CGPoint point5_C = CGPointMake(triAngH + corRad, corRad - vOffset);
            
            [path moveToPoint:point0];
            [path addLineToPoint:point1];
            [path addLineToPoint:point2];
            [path addLineToPoint:pointA];
            [path addArcWithCenter:point2_C radius:corRad startAngle:M_PI endAngle:M_PI * 0.5 clockwise:NO];
            [path addLineToPoint:point3];
            [path addArcWithCenter:point3_C radius:corRad startAngle:M_PI * 0.5 endAngle:0 clockwise:NO];
            [path addLineToPoint:point4];
            [path addArcWithCenter:point4_C radius:corRad startAngle:0 endAngle:M_PI + M_PI_2 clockwise:NO];
            [path addLineToPoint:point5];
            [path addArcWithCenter:point5_C radius:corRad startAngle:M_PI + M_PI_2 endAngle:M_PI clockwise:NO];
        }
    }
    
    [path closePath];
    self.popLayer.path = path.CGPath;
    self.popLayer.opaque = YES;
    self.popLayer.strokeColor = _layerColor ? _layerColor.CGColor : [UIColor whiteColor].CGColor;
}

@end

@interface KVPopView () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) KVPopViewContainerView *containerView;
@property (nonatomic, strong) UITableView *table;
@property (nonatomic, strong) NSArray *titleMenus;
@property (nonatomic, strong) NSArray *titleInfoes;
@property (nonatomic, assign) KVVAlignStyle vAlignStyle;
@property (nonatomic, assign) KVHAlignStyle hAlignStyle;
@property (nonatomic, assign) CGPoint showPoint;
@end

@implementation KVPopView

+ (instancetype)popView
{
    return [[self alloc] init];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initDefaultConfig];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cpScreenOrientationChange) name:UIDeviceOrientationDidChangeNotification object:nil];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initDefaultConfig];
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.1];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cpScreenOrientationChange) name:UIDeviceOrientationDidChangeNotification object:nil];
    }
    return self;
}

- (instancetype)initWithBounds:(CGRect)bounds titleMenus:(NSArray *)titles config:(KVPopViewConfiguration *)config
{
    self = [super initWithFrame:bounds];
    if (self) {
        if (!config) {
            [self initDefaultConfig];
        } else {
            _config = config;
        }
        self.titleMenus = titles;
        
        self.table.frame = CGRectMake(0, 0, CGRectGetWidth(bounds), CGRectGetHeight(bounds));
        self.table.delegate = self;
        self.table.dataSource = self;
        [self setContent:self.table];
        _table.bounces = NO;
        if ([_table respondsToSelector:@selector(setSeparatorInset:)]) { //让线头不留白
            [_table setSeparatorInset:UIEdgeInsetsZero];
        }
        if ([_table respondsToSelector:@selector(setLayoutMargins:)]) {
            [_table setLayoutMargins:UIEdgeInsetsZero];
        }
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cpScreenOrientationChange) name:UIDeviceOrientationDidChangeNotification object:nil];
    }
    return self;
}

- (instancetype)initWithBounds:(CGRect)bounds titleInfo:(NSArray <NSDictionary<NSString *,NSString *> *>*)infoes config:(KVPopViewConfiguration *)config
{
    self = [super initWithFrame:bounds];
    if (self) {
        if (!config) {
            [self initDefaultConfig];
        } else {
            _config = config;
        }
        
        self.titleInfoes = infoes;
        self.table.frame = CGRectMake(0, 0, CGRectGetWidth(bounds), CGRectGetHeight(bounds));
        self.table.delegate = self;
        self.table.dataSource = self;
        [self setContent:self.table];
        _table.bounces = NO;
        if ([_table respondsToSelector:@selector(setSeparatorInset:)]) { // 让线头不留白
            [_table setSeparatorInset:UIEdgeInsetsZero];
        }
        if ([_table respondsToSelector:@selector(setLayoutMargins:)]) {
            [_table setLayoutMargins:UIEdgeInsetsZero];
        }
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cpScreenOrientationChange) name:UIDeviceOrientationDidChangeNotification object:nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)initDefaultConfig
{
    _config = [KVPopViewConfiguration new];
    _config.triAngelHeight = 8.0;
    _config.triAngelWidth = 10.0;
    _config.containerViewCornerRadius = 5.0;
    _config.roundMargin = 10.0;
    _config.showSpace = 15.f;
    
    _config.defaultRowHeight = 44.f;
    _config.tableBackgroundColor = [UIColor whiteColor];
    _config.separatorColor = [UIColor blackColor];
    _config.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _config.textColor = [UIColor blackColor];
    _config.font = [UIFont systemFontOfSize:14.0];
}

- (void)setContent:(UIView *)content
{
    _content = content;
    [self.containerView addSubview:content];
}

- (void)setContentViewController:(UIViewController *)contentViewController
{
    _contentViewController = contentViewController;
    [self setContent:_contentViewController.view];
}

- (void)setContainerBackgroudColor:(UIColor *)containerBackgroudColor
{
    _containerBackgroudColor = containerBackgroudColor;
    self.containerView.layerColor = _containerBackgroudColor;
}

- (void)showFromPoint:(CGPoint)point vAlignStyle:(KVVAlignStyle)vStyle hAlignStyle:(KVHAlignStyle)hStyle {
    _showPoint = point;
    _vAlignStyle = vStyle;
    _hAlignStyle = hStyle;
    [self showHandle];
}

- (void)showFromView:(UIView *)view vAlignStyle:(KVVAlignStyle)vStyle hAlignStyle:(KVHAlignStyle)hStyle
{
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    CGRect newRect = [view convertRect:view.bounds toView:window];
    _showPoint = CGPointMake(newRect.origin.x + newRect.size.width * 0.5, newRect.origin.y + newRect.size.height * 0.5);
    _vAlignStyle = vStyle;
    _hAlignStyle = hStyle;
    [self showHandle];
}

- (void)showHandle {
    
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    [window addSubview:self];
    [self updateSubViewFrames];
    
    if ([self.delegate respondsToSelector:@selector(popOverViewDidShow:)]) {
        [self.delegate popOverViewDidShow:self];
    }
    
    if (_config.isNeedAnimate) {
        self.containerView.transform = CGAffineTransformMakeScale(1.1, 1.1);
        self.containerView.alpha = 0;
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.2];
        self.containerView.transform = CGAffineTransformMakeScale(1.0, 1.0);
        self.containerView.alpha = 1;
        [UIView commitAnimations];
    }
}

- (void)dismiss
{
    if (_config.isNeedAnimate) {
        [UIView animateWithDuration:0.2 animations:^{
            self.containerView.transform = CGAffineTransformMakeScale(0.9,0.9);
            self.containerView.alpha = 0;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    } else {
        [self removeFromSuperview];
    }
    
    if ([self.delegate respondsToSelector:@selector(popOverViewDidDismiss:)]) {
        [self.delegate popOverViewDidDismiss:self];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (self.config.shouldDismissOnTouchOutside) {
        [self dismiss];
    }
}

- (NSDictionary *)hConfig {
    
    CGFloat kScreenW = [[[UIApplication sharedApplication] delegate] window].frame.size.width;
    CGPoint newPoint = _showPoint;
    CGFloat W = _config.showSpace + _config.triAngelHeight + _config.roundMargin * 2 + _content.frame.size.width;
    KVHAlignStyle currentHAlignStyle = KVHAlignStyleNone;
    CGFloat currentHOffset = 0;
    
    if (newPoint.x - W >= 0) { // 放左边
        currentHAlignStyle = KVHAlignStyleLeft;
    } else if (newPoint.x + W <= kScreenW) { // 放右边
        currentHAlignStyle = KVHAlignStyleRight;
    } else {
        currentHAlignStyle = KVHAlignStyleCenter;
        W = _config.roundMargin * 2 + _content.frame.size.width;
        if (kScreenW < W) {
            currentHOffset = newPoint.x - kScreenW * 0.5;
        } else {
            if (newPoint.x + W * 0.5 < kScreenW && newPoint.x - W * 0.5 > 0) { // 放中间
                currentHOffset = 0;
            } else if (newPoint.x + W * 0.5 < kScreenW) { // 放中间、右移
                currentHOffset = 0 - (newPoint.x - W * 0.5);
            } else { // 放中间、左移
                currentHOffset = kScreenW - (newPoint.x + W * 0.5);
            }
        }
    }
    return @{@"style": @(currentHAlignStyle), @"offset": @(currentHOffset), @"w": @(W)};
}

- (NSDictionary *)vConfigWith:(CGFloat)H hStype:(KVHAlignStyle)hStyle {
    
    CGFloat kScreenH = [[[UIApplication sharedApplication] delegate] window].frame.size.height;
    CGPoint newPoint = _showPoint;
    
    KVVAlignStyle currentVAlignStyle;
    CGFloat currentVOffset = 0;
    
    if (newPoint.y - H >= 0) {
        currentVAlignStyle = KVVAlignStyleTop;
    } else if (newPoint.y + H <= kScreenH) {
        currentVAlignStyle = KVVAlignStyleBottom;
    } else {
        if (hStyle == KVHAlignStyleRight || hStyle == KVHAlignStyleLeft) {
            currentVAlignStyle = KVVAlignStyleNone;
            if (kScreenH < H) {
                currentVOffset = newPoint.y - kScreenH * 0.5;
            } else {
                if (newPoint.y + H * 0.5 <= kScreenH && newPoint.y - H * 0.5 >= 0) { // 放中间
                    currentVOffset = 0;
                } else if (newPoint.y + H * 0.5 <= kScreenH) { // 放中间、下移
                    currentVOffset = -(newPoint.y - H * 0.5);
                } else { // 放中间、上移
                    currentVOffset = kScreenH - (newPoint.y + H * 0.5);
                }
            }
        } else {
            if (fabs(newPoint.y - H) >= fabs(newPoint.y + H - kScreenH)) {
                currentVAlignStyle = KVVAlignStyleBottom;
            } else {
                currentVAlignStyle = KVVAlignStyleTop;
            }
        }
    }
    return @{@"style": @(currentVAlignStyle), @"offset": @(currentVOffset)};
}

- (void)updateSubViewFrames
{
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    self.frame = window.bounds;
    
    CGFloat kScreenW = window.frame.size.width;
    CGFloat kScreenH = window.frame.size.height;
    CGPoint newPoint = _showPoint;
    
    // 水平方向样式
    
    KVHAlignStyle currentHAlignStyle = KVHAlignStyleNone;
    CGFloat currentHOffset = 0;
    CGFloat W = _config.showSpace + _config.triAngelHeight + _config.roundMargin * 2 + _content.frame.size.width;
    
    switch (_hAlignStyle) {
        case KVHAlignStyleLeft:
            if (newPoint.x - W >= 0) { // 放左边
                currentHAlignStyle = KVHAlignStyleLeft;
            }
            break;
        case KVHAlignStyleRight:
            if (newPoint.x + W <= kScreenW) { // 放右边
                currentHAlignStyle = KVHAlignStyleRight;
            }
            break;
        case KVHAlignStyleCenter:
            W = _config.roundMargin * 2 + _content.frame.size.width;
            currentHAlignStyle = KVHAlignStyleCenter;
            if (kScreenW >= W) {
                if (newPoint.x + W * 0.5 < kScreenW && newPoint.x - W * 0.5 > 0) { // 放中间
                    currentHOffset = 0;
                } else if (newPoint.x + W * 0.5 < kScreenW) { // 放中间、右移
                    currentHOffset = 0 - (newPoint.x - W * 0.5);
                } else { // 放中间、左移
                    currentHOffset = kScreenW - (newPoint.x + W * 0.5);
                }
            }
            break;
        default:
            break;
    }
    
    if (currentHAlignStyle == KVHAlignStyleNone) {
        NSDictionary *hConfig = [self hConfig];
        currentHAlignStyle = [(NSNumber *)hConfig[@"style"] integerValue];
        currentHOffset = [(NSNumber *)hConfig[@"offset"] doubleValue];
        W = [(NSNumber *)hConfig[@"w"] doubleValue];
    }
    
    // 垂直方向样式
    
    KVVAlignStyle currentVAlignStyle = KVVAlignStyleNone;
    CGFloat currentVOffset = 0;
    CGFloat H = 0;
    if (currentHAlignStyle == KVHAlignStyleRight || currentHAlignStyle == KVHAlignStyleLeft) {
        H = _config.roundMargin * 2 + _content.frame.size.height;
    } else {
        H = _config.roundMargin * 2 + _content.frame.size.height + _config.showSpace + _config.triAngelHeight;
    }
    
    switch (_vAlignStyle) {
        case KVVAlignStyleTop:
            if (newPoint.y - H >= 0) {
                currentVAlignStyle = KVVAlignStyleTop;
            }
            break;
        case KVVAlignStyleBottom:
            if (newPoint.y + H <= kScreenH) {
                currentVAlignStyle = KVVAlignStyleBottom;
            }
            break;
        default:
            break;
    }
    
    if (currentVAlignStyle == KVHAlignStyleNone) {
        NSDictionary *vConfig = [self vConfigWith:H hStype:currentHAlignStyle];
        currentVAlignStyle = [(NSNumber *)vConfig[@"style"] integerValue];
        currentVOffset = [(NSNumber *)vConfig[@"offset"] doubleValue];
    }
    
    [self updateFrameWithHStyle:currentHAlignStyle currentHOffset:currentHOffset vStyle:currentVAlignStyle currentVOffset:currentVOffset newPoint:newPoint w:W h:H];
}

- (void)updateFrameWithHStyle:(KVHAlignStyle)currentHAlignStyle
               currentHOffset:(CGFloat)currentHOffset
                       vStyle:(KVVAlignStyle)currentVAlignStyle
               currentVOffset:(CGFloat)currentVOffset
                     newPoint:(CGPoint)newPoint
                            w:(CGFloat)W
                            h:(CGFloat)H {
    
    CGFloat trueW = W;
    CGFloat trueH = H;
    CGFloat containerX = 0;
    CGFloat contentX = 0;
    if (currentHAlignStyle == KVHAlignStyleLeft) {
        trueW = W - _config.showSpace;
        containerX = newPoint.x - W;
        contentX = _config.roundMargin;
    } else if (currentHAlignStyle == KVHAlignStyleRight) {
        trueW = W - _config.showSpace;
        containerX = newPoint.x + _config.showSpace;
        contentX = _config.triAngelHeight + _config.roundMargin;
    } else if (currentHAlignStyle == KVHAlignStyleCenter) {
        containerX = newPoint.x - W * 0.5 + currentHOffset;
        contentX = _config.roundMargin;
    }
    CGFloat containerY = 0;
    CGFloat contentY = 0;
    if (currentVAlignStyle == KVVAlignStyleTop) {
        if (currentHAlignStyle != KVHAlignStyleCenter) {
            containerY = newPoint.y - H + (_config.containerViewCornerRadius + _config.triAngelWidth * 0.5);
            contentY = _config.roundMargin;
        } else {
            trueH = H - _config.showSpace;
            containerY = newPoint.y - H;
            contentY = _config.roundMargin;
        }
    } else if (currentVAlignStyle == KVVAlignStyleBottom) {
        if (currentHAlignStyle != KVHAlignStyleCenter) {
            containerY = newPoint.y - (_config.containerViewCornerRadius + _config.triAngelWidth * 0.5);
            contentY = _config.roundMargin;
        } else {
            trueH = H - _config.showSpace;
            containerY = newPoint.y + _config.showSpace;
            contentY =  _config.roundMargin + _config.triAngelHeight;
        }
    } else {
        containerY = newPoint.y - H * 0.5 + currentVOffset;
        contentY = _config.roundMargin;
    }
    
    self.containerView.frame = CGRectMake(containerX, containerY, trueW, trueH);
    self.content.frame = CGRectMake(contentX, contentY, self.content.frame.size.width, self.content.frame.size.height);
    [self.containerView setLayerWithVAlignStyle:currentVAlignStyle vOffset:currentVOffset hAlignStyle:currentHAlignStyle hOffset:currentHOffset];
}

#pragma mark- Notis

- (void)cpScreenOrientationChange
{
    [self updateSubViewFrames];
}

#pragma mark- lazy
- (KVPopViewContainerView *)containerView
{
    if (nil == _containerView) {
        _containerView = [[KVPopViewContainerView alloc]initWithConfig:_config];
        [self addSubview:_containerView];
    }
    return _containerView;
}

- (UITableView *)table
{
    if (nil == _table) {
        _table = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _table.backgroundColor = _config.tableBackgroundColor;
        _table.separatorColor = _config.separatorColor;
        _table.rowHeight = _config.defaultRowHeight?:44.f;
        _table.separatorStyle = _config.separatorStyle?:UITableViewCellSeparatorStyleSingleLine;
        _table.tableFooterView = [UIView new];
    }
    return _table;
}

#pragma mark- <UITableViewDelegate, UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleMenus.count ? : self.titleInfoes.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"GYPopOverCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.contentView.backgroundColor = [UIColor clearColor];
    }
    
    NSString *text;
    NSString *icon;
    if (self.titleMenus.count) {
        text = self.titleMenus[indexPath.row];
    }
    
    if (self.titleInfoes.count) {
        NSDictionary *dic = self.titleInfoes[indexPath.row];
        text = dic[@"name"];
        icon = dic[@"icon"];
    }
    
    cell.textLabel.text = text;
    cell.textLabel.textColor = _config.textColor;
    cell.textLabel.font = _config.font;
    cell.textLabel.textAlignment = _config.textAlignment;
    cell.imageView.image = [UIImage imageNamed:icon];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(popOverView:didClickMenuIndex:)]) {
        [self.delegate popOverView:self didClickMenuIndex:indexPath.row];
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell setBackgroundColor:[UIColor clearColor]];
    
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

@end
