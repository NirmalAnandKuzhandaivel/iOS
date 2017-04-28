//
//  Dealer.m
//  Assignment3
//

//  Copyright © 2016 nirmal. All rights reserved.
//

#import "Dealer.h"
#import "Department.h"
@implementation Dealer

-(void)addDepartment:(Department *) department{
    if(_departments==nil){
        _departments=[[NSMutableArray alloc]init];
    }
    [_departments addObject:department];
    
    
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [self init];
    self.city = [coder decodeObjectForKey:@"city"];
    self.name    = [coder decodeObjectForKey:@"name"];
    self.address = [coder decodeObjectForKey:@"address"];
    self.phone = [coder decodeObjectForKey:@"phone"];
    [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:_departments] forKey:@"departments"];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_city forKey:@"city"];
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeObject:_address forKey:@"address"];
    [aCoder encodeObject:_phone forKey:@"phone"];
    [aCoder encodeObject:_departments forKey:@"departments"];
}



@end
