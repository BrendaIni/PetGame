//
//  ViewController.m
//  PetGame
//
//  Created by Brenda Iñiguez on 6/23/16.
//  Copyright (c) 2016 UAGMobile. All rights reserved.
//

#import "Start.h"

@interface Start ()

@end

@implementation Start

/****************************************************************************/
#pragma mark - Initialization methods
/****************************************************************************/

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) initController {
    maIntroTitles  = [[NSMutableArray alloc] initWithObjects: @"Elige tu tipo de mascota", @"Elige tu deporte preferido", @"Diviertanse juntos!!", nil];
    maIntroImages  = [[NSMutableArray alloc] initWithObjects: @"mascota.jpg", @"deportes.jpg", @"play.jpg", nil];
    
    [self createPageViews];
}

/****************************************************************************/
#pragma mark - Page controllers methods and delegates
/****************************************************************************/

- (void)createPageViews {
    // Create page view controller
    self.pageViewController             = [self.storyboard instantiateViewControllerWithIdentifier:@"PageIntroController"];
    self.pageViewController.dataSource  = self;
    
    Intro *startingViewController       = [self viewControllerAtIndex:0];
    NSArray *viewControllers            = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    // Change the size of page view controller
    self.pageViewController.view.frame  = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    
    NSArray *subviews = self.pageViewController.view.subviews;
    UIPageControl *thisControl = nil;
    for (int i=0; i<[subviews count]; i++) {
        if ([[subviews objectAtIndex:i] isKindOfClass:[UIPageControl class]]) {
            thisControl = (UIPageControl *)[subviews objectAtIndex:i];
        }
    }
    thisControl.hidden = true;
}
//-------------------------------------------------------------------------------
- (Intro *)viewControllerAtIndex:(NSUInteger)index
{
    if (([maIntroTitles count] == 0) || (index >= [maIntroTitles count])) {
        return nil;
    }
    // Create a new view controller and pass suitable data.
    Intro *pageIntro        = [self.storyboard instantiateViewControllerWithIdentifier:@"Intro"];
    pageIntro.lblIntro      = maIntroTitles[index];
    pageIntro.iPageIndex    = index;
    
    return pageIntro;
}
//-------------------------------------------------------------------------------
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((Intro*) viewController).iPageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    index--;
    return [self viewControllerAtIndex:index];
}
//-------------------------------------------------------------------------------
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((Intro*) viewController).iPageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    index++;
    return [self viewControllerAtIndex:index];
}
//-------------------------------------------------------------------------------
- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [maIntroTitles count];
}
//-------------------------------------------------------------------------------
- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}



@end
