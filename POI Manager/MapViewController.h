//
//  MapViewController.h
//  POI Manager
//
//  Created by carlos calderon on 4/13/16.
//  Copyright © 2016 carlos calderon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Venue.h"

@interface MapViewController : UIViewController
@property (weak, nonatomic) IBOutlet MKMapView *mapVIew;
@property (strong, nonatomic) Venue  *venue;
- (IBAction)showDirectionsBarButtonPressed:(UIBarButtonItem *)sender;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;

@end
