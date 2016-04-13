//
//  Location+CoreDataProperties.h
//  POI Manager
//
//  Created by carlos calderon on 4/13/16.
//  Copyright © 2016 carlos calderon. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Location.h"

NS_ASSUME_NONNULL_BEGIN

@interface Location (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *address;
@property (nullable, nonatomic, retain) NSString *cc;
@property (nullable, nonatomic, retain) NSString *city;
@property (nullable, nonatomic, retain) NSString *country;
@property (nullable, nonatomic, retain) NSString *crossStreet;
@property (nullable, nonatomic, retain) NSString *attribute;
@property (nullable, nonatomic, retain) NSNumber *lat;
@property (nullable, nonatomic, retain) NSNumber *lng;
@property (nullable, nonatomic, retain) NSString *postalCode;
@property (nullable, nonatomic, retain) NSString *state;
@property (nullable, nonatomic, retain) NSManagedObject *venue;

@end

NS_ASSUME_NONNULL_END
