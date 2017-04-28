//
//  Department.h
//  Assignment3
//

//  Copyright © 2016 nirmal. All rights reserved.
//

#import <Foundation/Foundation.h>


@class Dealer;
@class Vehicle;
@class Employee;
@interface Department : NSObject<NSCoding>

@property(assign,nonatomic,readwrite) NSString *name;
@property(assign,nonatomic,readwrite) NSString *phone;
@property(assign,nonatomic,readwrite) Dealer *dealer;
@property NSMutableArray<Vehicle* > *vehicles;
@property NSMutableArray<Employee* > *employees;

-(void)addVehicle:(Vehicle *) vehicle;
-(void)listVehicles;

-(void)addEmployee:(Employee *) employee;
-(void)listEmployees;

-(NSMutableArray<Vehicle* > *) searchVehicles:(NSString *) vehicleModel;

-(Vehicle *) modifyVehicle:(NSString *) vehicleName;

@end


