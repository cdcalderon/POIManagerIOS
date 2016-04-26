//
//  DirectionsLIstViewController.m
//  POI Manager
//
//  Created by carlos calderon on 4/26/16.
//  Copyright © 2016 carlos calderon. All rights reserved.
//

#import "DirectionsLIstViewController.h"
#import <MapKit/MapKit.h>

@interface DirectionsLIstViewController ()

@end

@implementation DirectionsLIstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
}

#pragma mark - UITableViewDataSource methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.steps count];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    MKRoute *route = self.steps[section];
    
    return [route.steps count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    MKRoute *route = self.steps[indexPath.section];
    MKRouteStep *step = route.steps[indexPath.row];
    cell.textLabel.text = step.instructions;
    cell.detailTextLabel.text = step.notice;
    
    [self loadMapSnapShots: indexPath];
    
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *sectionlabel = [[UILabel alloc] init];
    sectionlabel.textColor = [UIColor redColor];
    sectionlabel.font = [UIFont boldSystemFontOfSize:16];
    sectionlabel.backgroundColor = [UIColor clearColor];

    
    sectionlabel.text = [NSString stringWithFormat:@"Route %i", section + 1];
    
    return sectionlabel;
}

#pragma mark - Map SnapShots Methods

-(void)loadMapSnapShots:(NSIndexPath *)indexPath
{
    MKRoute *mapRoute = self.steps[indexPath.section];
    MKRouteStep *routeStep = mapRoute.steps[indexPath.row];
    MKMapSnapshotOptions *options = [[MKMapSnapshotOptions alloc] init];
    
    options.scale = [UIScreen mainScreen].scale; // retina or not
    
    MKMapRect rect;
    rect.origin = routeStep.polyline.points[0];
    rect.size = MKMapSizeMake(0.0, 0.0);
    
    MKCoordinateRegion region = MKCoordinateRegionForMapRect(rect);
    region.span.latitudeDelta =  0.001;
    region.span.longitudeDelta =  0.001;
    options.region = region;
    options.size = CGSizeMake(35.0, 35.0);
    
    MKMapSnapshotter *snapshotter = [[MKMapSnapshotter alloc] initWithOptions:options];
    [snapshotter startWithCompletionHandler:^(MKMapSnapshot *snapshot, NSError *error) {
        NSLog(@"SnapShot error %@",error);
        if (!error) {
            UITableViewCell *snapCell = [self.tableView cellForRowAtIndexPath:indexPath];
            snapCell.imageView.image = snapshot.image;
            [snapCell setNeedsLayout];
        }
    }];
}

@end
