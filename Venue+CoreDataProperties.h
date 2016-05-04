//
//  Venue+CoreDataProperties.h
//  
//
//  Created by carlos calderon on 5/3/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Venue.h"

NS_ASSUME_NONNULL_BEGIN

@interface Venue (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *id;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSNumber *favorite;
@property (nullable, nonatomic, retain) FSCategory *categories;
@property (nullable, nonatomic, retain) Contact *contact;
@property (nullable, nonatomic, retain) Location *location;
@property (nullable, nonatomic, retain) Menu *menu;

@end

NS_ASSUME_NONNULL_END
