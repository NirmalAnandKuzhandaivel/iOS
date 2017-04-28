//
//  Department.m
//  Assignment3
//

//  Copyright © 2016 nirmal. All rights reserved.
//

#import "Department.h"
#import "Dealer.h"
#import "Vehicle.h"
#import "Employee.h"

@implementation Department

-(void)addVehicle:(Vehicle *) vehicle{
    if(_vehicles==nil){
        _vehicles=[[NSMutableArray alloc]init];
    }
    [_vehicles addObject:vehicle];
}

-(void)listVehicles{
    for(Vehicle *v in _vehicles){
        NSLog(@"Inside here");
        NSLog(@"Vehicle Make %@",v.make);
        NSLog(@"Vehicle Model %@",v.model);
        NSLog(@"Vehicle Type %@",v.type);
        NSLog(@"Vehicle Price%@",v.price);
        NSLog(@"Vehicle Rating%li",v.rating);
        NSLog(@"Vehicle Date%@",v.year);
        
        
    }
    
}


-(NSMutableArray<Vehicle* > *) searchVehicles:(NSString *) vehicleModel{
    NSMutableArray<Vehicle* >   *listOfVehicles=[[NSMutableArray<Vehicle* > alloc]init];
       for(Vehicle *v in _vehicles){
           if([v.model isEqualToString:vehicleModel]){
               [listOfVehicles addObject:v];
           }
           
           
       }
    
    return listOfVehicles;
}

-(void)addEmployee:(Employee *)employee{
    if (_employees==nil) {
        _employees=[[NSMutableArray alloc] init];
    }
    [_employees addObject:employee];
}

-(void)listEmployees{
    for(Employee *e in _employees){

        NSLog(@"Employee First Name %@",e.firstName);
        NSLog(@"Employee Last Name%@",e.LastName);
        NSLog(@"Employee City%@",e.city);
        NSLog(@"Employee Address%@",e.address);
        NSLog(@"Employee Phone%@",e.phone);
        NSLog(@"Employee Zipcode%@",e.zip);
        NSLog(@"Employee SSN%@",e.ssn);
        
    }

}

@end
