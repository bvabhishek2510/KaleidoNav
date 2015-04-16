//
//  ramViewController.h
//  KaleidoNav
//
//  Created by is-Lib on 4/21/14.
//  Copyright (c) 2014 is-Lib. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ramview.h"

@class configViewController;
@interface ramViewController : UIViewController
{
    configViewController *ramcvc;
}
@property(nonatomic,strong)configViewController *ramcvc;
@property (nonatomic)         CGFloat    delay;
@property (nonatomic, retain) NSRunLoop *runloop;
@property (nonatomic) NSString *speed;
@property (nonatomic) NSTimer *timer;
@property (nonatomic,retain)  ramview *kaleidoView;




@end
