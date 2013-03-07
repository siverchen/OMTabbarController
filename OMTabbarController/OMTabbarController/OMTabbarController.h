//
//  OMTabbarController.h
//  OMTabbarController
//
//  Created by Chen Lei on 13-3-7.
//  Copyright (c) 2013年 cmc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OMTabbar.h"


@interface OMTabbarController : UIViewController <OMTabbarDelegate>{
    
}

@property (retain, nonatomic) NSArray *viewControllers;
@property (retain, nonatomic) NSArray *nibNames;
@property (retain, nonatomic) NSArray *classNames;
@property (assign, nonatomic) NSUInteger selectIndex;
@property (retain, nonatomic) OMTabbar *tabbar;

- (void)setSelectIndex:(NSUInteger)selectIndex Animated:(BOOL)animated;
- (void)bindViewControllersWithNibnames:(NSArray *)nibNames;
- (void)bindViewControllersWithClassnames:(NSArray *)classNames;
- (void)bindViewControllers:(id)viewControllers;


@end
