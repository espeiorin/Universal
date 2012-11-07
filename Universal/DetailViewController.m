//
//  DetailViewController.m
//  Universal
//
//  Created by André Gustavo Espeiorin on 22/10/12.
//  Copyright (c) 2012 André Gustavo Espeiorin. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(NSDictionary *)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
    
    self.title = [newDetailItem objectForKey:@"name"];

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    if (self.detailItem) {
        self.productNameLabel.text = [self.detailItem objectForKey:@"name"];
        self.productDescriptionLabel.text = [self.detailItem objectForKey:@"description"];
        self.productSnapshotView.image = [UIImage imageNamed:[self.detailItem objectForKey:@"snapshot"]];
        NSString *brandText = [NSString stringWithFormat:@"%@\n%@",
                               [[self.detailItem objectForKey:@"brand"] objectForKey:@"name"],
                               [[self.detailItem objectForKey:@"brand"] objectForKey:@"description"]
                               ];
        self.brandDescriptionView.text = brandText;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Produtos", @"Produtos");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

- (BOOL) splitViewController:(UISplitViewController *)svc shouldHideViewController:(UIViewController *)vc inOrientation:(UIInterfaceOrientation)orientation

{
    return NO;
}

@end
