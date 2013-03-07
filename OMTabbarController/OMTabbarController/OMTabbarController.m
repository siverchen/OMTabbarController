//
//  OMTabbarController.m
//  OMTabbarController
//
//  Created by Chen Lei on 13-3-7.
//  Copyright (c) 2013年 cmc. All rights reserved.
//

#import "OMTabbarController.h"
#import "OMTabbarItem.h"

#define DefaultBarHeight 100

typedef enum {
    TabbarBindType_VC,
    TabbarBindType_Nib,
    TabbarBindType_Class
}TabbarBindType;

@interface OMTabbarController (){
    TabbarBindType bindType;
    UIViewController *_currentViewController;
}

@end


@implementation OMTabbarController

- (void)dealloc{
    [_viewControllers release];
    [_nibNames release];
    [_classNames release];
    [_tabbar release];
    [_currentViewController release];
    [super dealloc];
}


- (id)init{
    if (self = [super init]){
        _tabbar = [[OMTabbar alloc] init];
        [_tabbar setDelegate:self];
        [_tabbar setBackgroundColor:[UIColor blueColor]];
        [_tabbar setFrame:CGRectMake(0, self.view.frame.size.height - DefaultBarHeight, self.view.frame.size.width, DefaultBarHeight)];
    }
    return self;
}
- (void)viewDidLoad{
    [super viewDidLoad];
    [self.view addSubview:_tabbar];
}


- (void)bindViewControllers:(id)viewControllers{
    bindType = TabbarBindType_VC;
    if (_viewControllers){
        [_viewControllers release];
        _viewControllers = nil;
    }
    _viewControllers = [viewControllers retain];
    _currentViewController = [_viewControllers objectAtIndex:0];
    [self.view insertSubview:_currentViewController.view atIndex:0];
}

- (void)bindViewControllersWithNibnames:(NSArray *)nibNames{
    bindType = TabbarBindType_Nib;
    if (_nibNames){
        [_nibNames release];
        _nibNames = nil;
    }
    _nibNames = [nibNames retain];
    _currentViewController = [[NSClassFromString([nibNames objectAtIndex:0]) alloc] initWithNibName:[nibNames objectAtIndex:0] bundle:nil];
    [self.view insertSubview:_currentViewController.view atIndex:0];
}

- (void)bindViewControllersWithClassnames:(NSArray *)classNames{
    bindType = TabbarBindType_Class;
    if (_classNames){
        [_classNames release];
        _classNames = nil;
    }
    
    _classNames = [classNames retain];
    _currentViewController = [[NSClassFromString([_classNames objectAtIndex:0]) alloc] init];
    [self.view insertSubview:_currentViewController.view atIndex:0];
}

- (void)setSelectIndex:(NSUInteger)selectIndex Animated:(BOOL)animated{
    if (_selectIndex == selectIndex){
        NSLog(@"same");
    }else{
        switch (bindType) {
            case TabbarBindType_Class:
                if (_currentViewController){
                    [_currentViewController.view removeFromSuperview];
                    [_currentViewController release];
                    _currentViewController = nil;
                }
                _currentViewController = [[NSClassFromString([_classNames objectAtIndex:selectIndex]) alloc] init];
                break;
                
            default:
                break;
        }
        [self.view insertSubview:_currentViewController.view atIndex:0];
        _selectIndex = selectIndex;
    }
}

#pragma mark - OMTabbarDelegate

- (void)tabBar:(OMTabbar *)tabbar didSelectItem:(OMTabbarItem *)item{
    [self setSelectIndex:[tabbar.items indexOfObject:item] Animated:NO];
}

@end
