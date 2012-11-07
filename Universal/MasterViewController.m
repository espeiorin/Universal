//
//  MasterViewController.m
//  Universal
//
//  Created by André Gustavo Espeiorin on 22/10/12.
//  Copyright (c) 2012 André Gustavo Espeiorin. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"

@interface MasterViewController ()

@property (nonatomic, strong) NSArray *objects;

@end

@implementation MasterViewController

@synthesize objects = _objects;

- (void)awakeFromNib
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    }
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSArray *) objects
{
    if (_objects == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"ProductList" ofType:@"json"];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
            NSData *data = [NSData dataWithContentsOfFile:path];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.objects = [NSJSONSerialization JSONObjectWithData:data
                                                               options:NSJSONReadingAllowFragments
                                                                 error:nil];
            });
        });
    }
    return _objects;
}

- (void) setObjects:(NSArray *)objects
{
    _objects = objects;
    [self.tableView reloadData];
}

#pragma mark - Table View
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];

    NSDictionary *object = self.objects[indexPath.row];
    
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"thumb_%@", [object objectForKey:@"snapshot"]]];
    cell.imageView.image = image;
    cell.textLabel.text = [object objectForKey:@"name"];
    cell.detailTextLabel.text = [object objectForKey:@"description"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *object = _objects[indexPath.row];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.detailViewController.detailItem = object;
    } else {
        DetailViewController *detailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailView"];
        detailViewController.detailItem = object;
        [self.navigationController pushViewController:detailViewController animated:YES];
    }
}

@end
