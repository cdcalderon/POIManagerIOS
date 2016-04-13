//
//  Venue+CoreDataProperties.h
//  POI Manager
//
//  Created by carlos calderon on 4/13/16.
//  Copyright © 2016 carlos calderon. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Venue.h"

NS_ASSUME_NONNULL_BEGIN

@interface Venue (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *id;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) FSCategory *categories;
@property (nullable, nonatomic, retain) Contact *contact;
@property (nullable, nonatomic, retain) Location *location;
@property (nullable, nonatomic, retain) Menu *menu;

@end

NS_ASSUME_NONNULL_END
