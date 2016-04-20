//
//  MapViewController.m
//  POI Manager
//
//  Created by carlos calderon on 4/13/16.
//  Copyright © 2016 carlos calderon. All rights reserved.
//

#import "MapViewController.h"
#import "Location.h"
#import "FSCategory.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nameLabel.text = self.venue.name;
    self.addressLabel.text = self.venue.location.address;

    
    float latitude = [self.venue.location.lat floatValue];
    float longitude = [self.venue.location.lng floatValue];
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(latitude, longitude);
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 800, 800);
    [self.mapVIew setRegion:[self.mapVIew regionThatFits:region] animated:YES];
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = coordinate;
    point.title = self.venue.name;
    
    FSCategory *cat = self.venue.categories;
    point.subtitle = cat.name;
    [self.mapVIew addAnnotation:point];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)showDirectionsBarButtonPressed:(UIBarButtonItem *)sender {
    [self performSegueWithIdentifier:@"mapToDIrectionsSegue" sender:nil];
}
@end
