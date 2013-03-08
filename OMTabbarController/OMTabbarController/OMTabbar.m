//
//  OMTabbar.m
//  OMTabbarController
//
//  Created by Chen Lei on 13-3-7.
//  Copyright (c) 2013年 cmc. All rights reserved.
//

#import "OMTabbar.h"
#import "OMTabbarItem.h"

@implementation OMTabbar




- (id)init{
    if (self = [super init]){
    }
    return self;
}

- (void)dealloc{
    [super dealloc];
    [_items release];
    [_backgroundImage release];
    [_selectedItem release];
}

- (void)setItems:(NSArray *)items animated:(BOOL)animated{
    if (_items){
        [_items release];
        _items = nil;
    }
    _items = [items retain];
    [self CreateItemViews];
}

- (void)setHeight:(CGFloat)height{
    CGRect frame = self.frame;
    self.frame = CGRectMake(frame.origin.x, frame.origin.y + frame.size.height - height, frame.size.width, height);
    for (OMTabbarItem *item in _items){
        CGRect iframe = item.frame;
        [item setFrame:(CGRect){
            .origin.x = iframe.origin.x,
            .origin.y = iframe.origin.y,
            .size.width = iframe.size.width,
            .size.height = height
        }];
    }
}


/**-------**/

- (void)CreateItemViews{
    int count = [_items count];
    CGFloat width = self.frame.size.width / count;
    for (int i = 0; i < count; i++){
        OMTabbarItem *item = [_items objectAtIndex:i];
        [item setFrame:CGRectMake(i * width, 0, width, self.frame.size.height)];
        [item addTarget:self action:@selector(SelectItem:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:item];
    }
}


- (void)SelectItem:(OMTabbarItem *)item{
    int index = [_items indexOfObject:item];
    if (_delegate && [_delegate respondsToSelector:@selector(tabBar:didSelectItem:)]){
        [_delegate tabBar:self didSelectItem:[_items objectAtIndex:index]];
    }
    
}


@end
