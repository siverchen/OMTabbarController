//
//  OMTabbarItem.m
//  OMTabbarController
//
//  Created by Chen Lei on 13-3-7.
//  Copyright (c) 2013年 cmc. All rights reserved.
//

#import "OMTabbarItem.h"

@interface OMTabbarItem (){
    UILabel *_title;
    UIImage *_finishedUnselectedimage;
    UIImage *_finishedSelectedImage;
}

@end

@implementation OMTabbarItem

- (void)dealloc{
    [_title release];
    [_finishedUnselectedimage release];
    [_finishedSelectedImage release];
    [_badgeValue release];
    [super dealloc];
}

- (void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    [_title setFrame:self.bounds];
}

- (id)initWithTitle:(NSString *)title image:(UIImage *)image id:(NSUInteger)itemid tag:(NSUInteger)tag{
    if (self = [super init]){
        _title = [[UILabel alloc] init];
        [_title setBackgroundColor:[UIColor clearColor]];
        [_title setTextAlignment:NSTextAlignmentCenter];
        [_title setText:title];
        _itemid = itemid;
        [self addSubview:_title];
    }
    return self;
}



@end
