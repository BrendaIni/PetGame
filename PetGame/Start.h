//
//  ViewController.h
//  PetGame
//
//  Created by Brenda Iñiguez on 6/23/16.
//  Copyright (c) 2016 UAGMobile. All rights reserved.
///Users/brenda/Documents/PetGame/PetGame/ViewController.h

#import <UIKit/UIKit.h>
#import "Declarations.h"
#import "Intro.h"

@interface Start : UIViewController <UIPageViewControllerDataSource, UIPageViewControllerDelegate>
@property (strong, nonatomic) UIPageViewController *pageViewController;

@end

