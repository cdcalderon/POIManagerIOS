//
//  DirectionsViewController.h
//  POI Manager
//
//  Created by carlos calderon on 4/19/16.
//  Copyright © 2016 carlos calderon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Venue.h"
#import "Location.h"
#import <MapKit/MapKit.h>

@interface DirectionsViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>

@property (strong, nonatomic) Venue *venue;
@property CLLocationManager *locationManager;
@property (strong, nonatomic) NSArray *steps;

@property (weak, nonatomic) IBOutlet MKMapView *directionsMap;

- (IBAction)listDirectionsBarButtonPressed:(id)sender;

@end
