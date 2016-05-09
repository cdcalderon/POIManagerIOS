//
//  FavoritePOIViewController.m
//  POI Manager
//
//  Created by carlos calderon on 5/3/16.
//  Copyright © 2016 carlos calderon. All rights reserved.
//

#import "FavoritePOIViewController.h"
#import "AppDelegate.h"
#import "Venue.h"
#import <MagicalRecord/MagicalRecord.h>

@interface FavoritePOIViewController ()

@property (strong, nonatomic) NSMutableArray *favorites;

@end

@implementation FavoritePOIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    if (!self.favorites) {
        self.favorites = [[NSMutableArray alloc] init];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated
{
    NSPredicate *predicateForFavorites = [NSPredicate predicateWithFormat:@"favorite == %@", [NSNumber numberWithBool:YES]];
    self.favorites = [[Venue MR_findAllWithPredicate:predicateForFavorites inContext:[NSManagedObjectContext MR_defaultContext]] mutableCopy];
    
    [self.tableView reloadData];
}

- (IBAction)barButtonItemPressed:(UIBarButtonItem *)sender {

    [[self drawControllerFromDelegate] toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

#pragma mark - DrawController Methods

-(MMDrawerController *)drawControllerFromDelegate
{
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];

    return appDelegate.drawerController;
}

#pragma mark - TableView Delegate Methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.favorites count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    Venue *venue = self.favorites[indexPath.row];
    cell.textLabel.text = venue.name;
    
    return cell;
}

@end
