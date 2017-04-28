//
//  Vehicle_ModifyVehicle.h
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
        [self setModel:model]
    }
    return self;
}

@end
