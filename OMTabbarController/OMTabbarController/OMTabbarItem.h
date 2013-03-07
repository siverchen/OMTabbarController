//
//  OMTabbarItem.h
//  OMTabbarController
//
//  Created by Chen Lei on 13-3-7.
//  Copyright (c) 2013年 cmc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OMTabbarItem : UIButton {
    
}

@property (nonatomic, retain) NSString *badgeValue;
@property (nonatomic, assign) NSUInteger itemid;

- (id)initWithTitle:(NSString *)title image:(UIImage *)image id:(NSUInteger)itemid tag:(NSUInteger)tag;

@end
