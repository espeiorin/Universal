//
//  DetailViewController.h
//  Universal
//
//  Created by André Gustavo Espeiorin on 22/10/12.
//  Copyright (c) 2012 André Gustavo Espeiorin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) NSDictionary *detailItem;

@property (weak, nonatomic) IBOutlet UILabel *productNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *productDescriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *productSnapshotView;
@property (weak, nonatomic) IBOutlet UITextView *brandDescriptionView;

@end