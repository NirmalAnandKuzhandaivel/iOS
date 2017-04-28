//
//  Vehicle.m
//  Assignment3
//
//  Created by Nirmal Anand Kuzhandaivel on 10/21/16.
//  Copyright © 2016 nirmal. All rights reserved.
//

#import "Vehicle.h"

@interface Vehicle ()

@property(readwrite) NSString *model;

@end

@implementation Vehicle


@synthesize model = _model;

- (id)initWithVehicleModel:(NSString *) model {
    self = [super init];
    if (self) {
        // This WILL work because of the extension.
        [self setModel:model];
    }
    return self;
}


- (id)initWithCoder:(NSCoder *)coder {
    self = [self init];
    self.make = [coder decodeObjectForKey:@"make"];
    self.miles    = [coder decodeObjectForKey:@"miles"];
    self.model = [coder decodeObjectForKey:@"model"];
    self.price = [coder decodeObjectForKey:@"price"];
    self.rating = [coder decodeIntegerForKey:@"rating"];
    self.type = [coder decodeObjectForKey:@"type"];
    self.year = [coder decodeObjectForKey:@"year"];
    self.department = [coder decodeObjectForKey:@"department"];
    
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_make forKey:@"make"];
    [aCoder encodeObject:_miles forKey:@"miles"];
    [aCoder encodeObject:_model forKey:@"model"];
    [aCoder encodeObject:_price forKey:@"price"];
    [aCoder encodeInteger:_rating forKey:@"rating"];
    [aCoder encodeObject:_type forKey:@"type"];
    [aCoder encodeObject:_year forKey:@"year"];
    [aCoder encodeObject:_department forKey:@"department"];
}

@end
