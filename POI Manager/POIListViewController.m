//
//  ViewController.m
//  POI Manager
//
//  Created by carlos calderon on 4/12/16.
//  Copyright © 2016 carlos calderon. All rights reserved.
//

#import "POIListViewController.h"
#import "POIFourSquareSessionManager.h"
#import <MagicalRecord/MagicalRecord.h>
#import "AFMMRecordResponseSerializationMapper.h"
#import "AFMMRecordResponseSerializer.h"
#import "Venue.h"
#import "Location.h"
#import "MapViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>

//Client id
//RODUBYAI1CMKTSLDI04NLRU53HXLKSWR43GYICGD3CUPP0FN
//Client secret
//VG5P3M0XMPZ1ZHMW3UTUJHM2R3QPSU4FATDKCKYLGC1IY5VS

static NSString * const kCLIENTID = @"RODUBYAI1CMKTSLDI04NLRU53HXLKSWR43GYICGD3CUPP0FN";

static NSString * const kCLIENTSECRET = @"VG5P3M0XMPZ1ZHMW3UTUJHM2R3QPSU4FATDKCKYLGC1IY5VS";

#define latitudeOffset 0.01
#define longitudeOffset 0.01

@interface POIListViewController () <CLLocationManagerDelegate>

@property (strong, nonatomic) NSArray *venues;
@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation POIListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate=self;
    self.locationManager.desiredAccuracy=kCLLocationAccuracyNearestTenMeters;
    self.locationManager.distanceFilter=10.0;
    [self.locationManager requestAlwaysAuthorization];
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8) {
        [_locationManager requestAlwaysAuthorization];
    }
    
    POIFourSquareSessionManager *sessionManager = [POIFourSquareSessionManager sharedClient];
    
    NSManagedObjectContext *context = [NSManagedObjectContext MR_defaultContext];
    
    AFHTTPResponseSerializer *HTTPResponseSerializer = [AFJSONResponseSerializer serializer];
    
    AFMMRecordResponseSerializationMapper *mapper = [[AFMMRecordResponseSerializationMapper alloc] init];
    
    [mapper registerEntityName:@"Venue" forEndpointPathComponent:@"venues/search?"];
    
    AFMMRecordResponseSerializer *serializer = [AFMMRecordResponseSerializer serializerWithManagedObjectContext:context responseObjectSerializer:HTTPResponseSerializer entityMapper:mapper];
    
    sessionManager.responseSerializer = serializer;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - CLLocationManagerDelegate
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    CLLocation *location = [locations lastObject];
    
    [self.locationManager stopUpdatingLocation];
    
    [[POIFourSquareSessionManager sharedClient] GET:[NSString stringWithFormat:@"venues/search?ll=%f,%f", location.coordinate.latitude + latitudeOffset, location.coordinate.longitude + longitudeOffset] parameters:@{@"client_id" : kCLIENTID, @"client_secret" : kCLIENTSECRET ,@"v": @"20140416"}
                                            success:^(NSURLSessionDataTask *task, id responseObject) {
                                                NSLog(@"%@",responseObject);
                                                NSArray *venues = responseObject;
                                                self.venues = venues;
                                                [self.tableView reloadData];
                                            } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                                NSLog(@"Error");
                                            }];

}

#pragma mark - Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = sender;
    Venue *venue = self.venues[indexPath.row];
    MapViewController *mapVC = segue.destinationViewController;
    mapVC.venue = venue;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.venues count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    Venue *venue = self.venues[indexPath.row];
    cell.textLabel.text = venue.name;
    cell.detailTextLabel.text = venue.location.address;
    return cell;
}
    

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"listToMapSegue" sender:indexPath];
}

#pragma mark - IBActions

- (IBAction)refreshBarButtonItemPressed:(UIBarButtonItem *)sender {
    
    [self.locationManager startUpdatingLocation];
}

@end
