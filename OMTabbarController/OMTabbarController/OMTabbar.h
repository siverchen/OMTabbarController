//
//  OMTabbar.h
//  OMTabbarController
//
//  Created by Chen Lei on 13-3-7.
//  Copyright (c) 2013年 cmc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OMTabbarItem;

@protocol OMTabbarDelegate;


@interface OMTabbar : UIView {
    
}

@property (nonatomic, retain) UIImageView *backgroundImage;
@property (nonatomic, retain) NSArray *items;
@property (nonatomic, retain) OMTabbarItem *selectedItem;
@property (nonatomic, assign) id <OMTabbarDelegate> delegate;
- (void)setItems:(NSArray *)items animated:(BOOL)animated;

@end

@protocol OMTabbarDelegate <NSObject>

- (void)tabBar:(OMTabbar *)tabbar didSelectItem:(OMTabbarItem *)item;

@end
