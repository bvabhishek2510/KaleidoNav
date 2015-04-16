//
//  ramview.h
//  KaleidoNav
//
//  Created by is-Lib on 4/21/14.
//  Copyright (c) 2014 is-Lib. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ramview : UIView
{
    CGLayerRef drawLayer;
}
@property (nonatomic) CGFloat    rect_x;
@property (nonatomic) CGFloat    rect_y;
@property (nonatomic) CGFloat    rect_width;
@property (nonatomic) CGFloat    rect_height;
@property (nonatomic) CGFloat    view_width;
@property (nonatomic) CGFloat    view_height;
@property (nonatomic) CGFloat    line_width;
@property (nonatomic) NSInteger  rect_width_min;
@property (nonatomic) NSInteger  rect_width_max;
@property (nonatomic) NSInteger  rect_height_min;
@property (nonatomic) NSInteger  rect_height_max;
@property (nonatomic) BOOL       debug;


-(void) drawToLayer;
-(void) drawRectUsing:(CGRect)cgrect withColor:(UIColor *)color;


@end
