//
//  DetailViewController.h
//  Universal
//
//  Created by André Gustavo Espeiorin on 22/10/12.
//  Copyright (c) 2012 André Gustavo Espeiorin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
