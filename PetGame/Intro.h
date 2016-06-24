//
//  Intro.h
//  PetGame
//
//  Created by Brenda Iñiguez on 6/23/16.
//  Copyright (c) 2016 UAGMobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Declarations.h"
#import "Home.h"

@interface Intro : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *lblIntro;
@property NSUInteger iPageIndex;
@property (strong, nonatomic) IBOutlet UIImageView *imgIntro;
@property (strong, nonatomic) IBOutlet UIButton *btnIntro;
- (IBAction)btnIntroPressed:(id)sender;


@end
