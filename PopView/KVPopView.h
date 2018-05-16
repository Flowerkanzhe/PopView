//
//  KVH.h
//  PopView
//
//  Created by woqugame on 2018/5/16.
//  Copyright © 2018年 FlowerKanZhe. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, KVHAlignStyle) {
    KVHAlignStyleNone,
    KVHAlignStyleCenter,
    KVHAlignStyleLeft,
    KVHAlignStyleRight
};

typedef NS_ENUM(NSUInteger, KVVAlignStyle) {
    KVVAlignStyleNone,
    KVVAlignStyleTop,
    KVVAlignStyleBottom
};

@class KVPopView;

@protocol KVPopViewDelegate <NSObject>
@optional
- (void)popOverViewDidShow:(KVPopView *)pView;
- (void)popOverViewDidDismiss:(KVPopView *)pView;
- (void)popOverView:(KVPopView *)pView didClickMenuIndex:(NSInteger)index;
@end

@interface KVPopViewConfiguration : NSObject
@property (nonatomic, assign) CGFloat showSpace; // 视图出现时与目标view的间隙
@property (nonatomic, assign) CGFloat triAngelHeight; // 小三角的高度
@property (nonatomic, assign) CGFloat triAngelWidth; // 小三角的宽度
@property (nonatomic, assign) CGFloat containerViewCornerRadius; // 弹出视图背景的圆角半径
@property (nonatomic, assign) CGFloat roundMargin; // 调整弹出视图背景四周的空隙

@property (nonatomic, assign) BOOL shouldDismissOnTouchOutside; // 点击空白区域是否消失（默认YES）
@property (nonatomic, assign) BOOL isNeedAnimate; // 开始和消失动画(默认YES)

@property (nonatomic, assign) CGFloat defaultRowHeight; // row高度
@property (nonatomic, strong) UIColor *tableBackgroundColor;
@property (nonatomic, strong) UIColor *separatorColor;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, assign) NSTextAlignment textAlignment;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, assign) UITableViewCellSeparatorStyle separatorStyle;
@end

@interface KVPopView : UIView
@property (nonatomic, strong) KVPopViewConfiguration *config;
@property (nonatomic, weak)   id<KVPopViewDelegate> delegate;
@property (nonatomic, strong) UIView *content;
@property (nonatomic, strong) UIViewController *contentViewController;
@property (nonatomic, strong) UIColor *containerBackgroudColor;

+ (instancetype)popView;
- (instancetype)initWithBounds:(CGRect)bounds titleMenus:(NSArray *)titles config:(KVPopViewConfiguration *)config;
- (instancetype)initWithBounds:(CGRect)bounds titleInfo:(NSArray<NSDictionary<NSString *, NSString *> *> *)infoes config:(KVPopViewConfiguration *)config;
- (void)showFromView:(UIView *)view vAlignStyle:(KVVAlignStyle)vStyle hAlignStyle:(KVHAlignStyle)hStyle;
- (void)showFromPoint:(CGPoint)point vAlignStyle:(KVVAlignStyle)vStyle hAlignStyle:(KVHAlignStyle)hStyle;
- (void)dismiss;

@end
