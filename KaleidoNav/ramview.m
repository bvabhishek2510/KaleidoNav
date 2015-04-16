//
//  ramview.m
//  KaleidoNav
//
//  Created by is-Lib on 4/21/14.
//  Copyright (c) 2014 is-Lib. All rights reserved.
//

#import "ramview.h"

@implementation ramview

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        // Debug output off/on
        self.debug = YES;
        
        // Area to draw in
        CGRect bounds = [self bounds];
        
        // Initialize properties
        self.rect_x          =  0.0;
        self.rect_y          =  0.0;
        self.rect_width      = 5.0;
        self.rect_height     = 10.0;
        self.line_width      =  1.0;
        self.view_width      = bounds.size.width;
        self.view_height     = bounds.size.height;
        self.rect_width_min  =  8;
        self.rect_width_max  = 20;
        self.rect_height_min =  7;
        self.rect_height_max = 20;
        
        NSString *str = @"ON";
        NSUserDefaults *def1 = [NSUserDefaults standardUserDefaults];
        [def1 setObject:str forKey:@"fill"];
        
        
        
        // Create ivar layer
        CGContextRef context = UIGraphicsGetCurrentContext();
        drawLayer = CGLayerCreateWithContext(context,
                                             CGSizeMake(bounds.size.width, bounds.size.height), NULL);
        
        

    }
    return self;
}
- (void)drawRect:(CGRect)rect
{
    
    // Draw to the layer
    [self drawToLayer];
    
    // Get the context being draw upon
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Copy layer to context
    CGContextDrawLayerInRect (context, [self bounds], drawLayer);
}

//==============================================================================
-(void) drawToLayer
{
    CGRect bounds=[self bounds];
    CGPoint center;
    center.x= bounds.origin.x + bounds.size.width/2.0;
    center.y=bounds.origin.y + bounds.size.height/2.0;
    //NSLog(@">>> %@", NSStringFromSelector(_cmd) );
    
    // Random values for color RGB, alpha
    CGFloat red   = 1.0 - (CGFloat)((random() % 100) / 100.0);
    CGFloat green = 1.0 - (CGFloat)((random() % 100) / 100.0);
    CGFloat blue  = 1.0 - (CGFloat)((random() % 100) / 100.0);
    CGFloat alpha = 1.0 - (CGFloat)((random() % 100) / 100.0);
    
    // Create the color
    UIColor *color = [UIColor colorWithRed:red
                                     green:green
                                      blue:blue
                                     alpha:alpha];
    
    // Random location
    self.rect_x = (CGFloat) (random() % (int) self.view_width);
    self.rect_y = (CGFloat) (random() % (int) self.view_height);
    
    
    
    
    // Random size
    // self.rect_width  = (CGFloat) (self.rect_width_min  + random() % self.rect_width_max);
    //self.rect_height = (CGFloat) (self.rect_height_min + random() % self.rect_height_max);
    
    NSInteger num1= random() % 200;
    NSInteger num = random() % 150;
    // Create the rectangle
    CGRect rect_1 = {center.x+num , center.y+num1 , self.rect_width, self.rect_height};
    CGRect rect_2 = {center.x-num , center.y+num1, self.rect_width, self.rect_height};
    CGRect rect_3 = {center.x-num , center.y-num1, self.rect_width, self.rect_height};
    CGRect rect_4 = {center.x+num , center.y-num1, self.rect_width, self.rect_height};
    
    
    // Debug
    if(self.debug)
        printf(">>> %s (%f, %f) %f %f\n", [[NSStringFromSelector(_cmd) description] UTF8String],
               self.rect_x, self.rect_y, self.rect_width, self.rect_height);
    
    // Call the drawing function
    [self drawRectUsing:rect_1 withColor:color];
    [self drawRectUsing:rect_2 withColor:color];
    [self drawRectUsing:rect_3 withColor:color];
    [self drawRectUsing:rect_4 withColor:color];
    
    
}

//==============================================================================
-(void) drawRectUsing:(CGRect) cgrect withColor:(UIColor *)color
{
    if (self.debug)
        //NSLog(@">>> %@, %@", NSStringFromSelector(_cmd), color );
        printf("### %s, %s\n", [[NSStringFromSelector(_cmd) description] UTF8String], [[color description]UTF8String]);
    
    // Get layer context
    CGContextRef layer_context = CGLayerGetContext (drawLayer);
    
    // Set line width, not meaningful if fill
    CGFloat line_width = 2.0;
    CGContextSetLineWidth(layer_context, line_width);
    
    // Get color components, note the address-of operator &
    CGFloat red, green, blue, alpha;
    [color getRed:&red green:&green blue:&blue alpha:&alpha];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *str = [defaults stringForKey:@"fill"];
    
    if ([str  isEqual: @"ON"]) {
        // Color
        CGContextSetRGBFillColor (layer_context, red, green, blue, alpha);
        CGContextSetRGBStrokeColor (layer_context, red, green, blue, alpha);
        
        // Draw rectangle
        CGContextAddRect(layer_context, cgrect);
        CGContextDrawPath(layer_context, kCGPathFill);
        
    } else {
        // Color
        CGContextSetRGBFillColor (layer_context, red, green, blue, alpha);
        CGContextSetRGBStrokeColor(layer_context, red, green, blue, alpha);
        
        
        
        //Draw rectangle
        CGContextStrokeRect(layer_context, cgrect);
        CGContextDrawPath(layer_context, kCGPathFill);
        
    }
    
    
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
