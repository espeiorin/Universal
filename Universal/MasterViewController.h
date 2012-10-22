//
//  MasterViewController.h
//  Universal
//
//  Created by André Gustavo Espeiorin on 22/10/12.
//  Copyright (c) 2012 André Gustavo Espeiorin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
