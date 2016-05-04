//
//  MenuViewController.m
//  POI Manager
//
//  Created by carlos calderon on 4/27/16.
//  Copyright © 2016 carlos calderon. All rights reserved.
//

#import "MenuViewController.h"
#import "POIListViewController.h"
#import "AppDelegate.h"

@interface MenuViewController ()

@property (strong, nonatomic) NSMutableArray *viewControllers;
@property (strong, nonatomic) UINavigationController *listNavigationViewController;

@property (strong, nonatomic) UINavigationController *favoritePOINavigationController;
@property (strong, nonatomic) UINavigationController *addPOINavigationController;


@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    if (!self.viewControllers)
    {
        self.viewControllers = [[NSMutableArray alloc] initWithCapacity:3];
    }
    
}

-(void)viewDidAppear:(BOOL)animated
{
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    
    if (!self.listNavigationViewController){
        
        
        MMDrawerController *drawController = [self drawControllerFromAppDelegate];
        self.listNavigationViewController = (UINavigationController *)drawController.centerViewController;
        [self.viewControllers addObject:self.listNavigationViewController];
    }
    
    if (!self.favoritePOINavigationController) {
        self.favoritePOINavigationController = (UINavigationController*)[mainStoryboard instantiateViewControllerWithIdentifier: @"FavoritePOIViewControllerID"];
        [self.viewControllers addObject:self.favoritePOINavigationController];
    }
    if (!self.addPOINavigationController) {
        self.addPOINavigationController = (UINavigationController*)[mainStoryboard instantiateViewControllerWithIdentifier: @"AddPOIViewControllerID"];
        [self.viewControllers addObject:self.addPOINavigationController];
    }
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.viewControllers count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    if (indexPath.row == 0){
        cell.textLabel.text = @"Home";
    } else if (indexPath.row == 1) {
        cell.textLabel.text = @"Favorites";
    }
    else if (indexPath.row == 2) {
        cell.textLabel.text = @"Add";
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate Methods

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MMDrawerController *drawController = [self drawControllerFromAppDelegate];
    [drawController setCenterViewController:self.viewControllers[indexPath.row] withCloseAnimation:YES completion:nil];
}


#pragma mark - DrawController Methods

-(MMDrawerController *)drawControllerFromAppDelegate
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    return appDelegate.drawerController;
}

@end
