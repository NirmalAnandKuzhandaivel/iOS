//
//  main.m
//  Assignment3
//

//  Copyright © 2016 nirmal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Department.h"
#import "Employee.h"
#import "Dealer.h"
#import "Vehicle.h"

int alphabeticalCheck(NSString *str);
int phoneNumberCheck(NSString *phoneNo);
int alphaNumericCheck(NSString *str1);


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        char dName[2048]={ 0} ,dPhone[2048]={ 0 } ;
        char deaName[2048]={ 0},deaPhone[2048]={ 0 },deaCity[2048]={ 0 },deaAddress[2048]={ 0 },vMake[2048]={ 0 },
        vModel[2048]={ 0 },veType[2048]={ 0 };
        
        char eFirstName[2048]={0}, eLastName[2048]={0}, eCity[2048]={0}, eAddress[2048]={0}, ePhone[2048]={0},
        eZip[2048]={0}, eSSN[2048]={0};
        
        //Get the Dealer Details
        
        NSLog(@"Enter the Dealer Details");
        NSLog(@"Dealer Name(Only Alphabets):");
        scanf("%s",deaName);
        NSLog(@"Dealer Phone No(Only Numbers up to 10 digits");
        scanf("%s",deaPhone);
        NSLog(@"Dealer City(Only Alphabets):");
        scanf("%s",deaCity);
        NSLog(@"Dealer Address(Only Alphanumeric");
        scanf("%s",deaAddress);
        
        NSString *dealerName = [NSString stringWithUTF8String:deaName];
        NSString *dealerPhone= [NSString stringWithUTF8String:deaPhone];
        NSString *dealerCity = [NSString stringWithUTF8String:deaCity];
        NSString *dealerAddress= [NSString stringWithUTF8String:deaAddress];
        
        if(alphabeticalCheck(dealerName)==1){
            NSLog(@" Error !! Enter only alphabets for Department Name");
            exit(0);
        }
        if(phoneNumberCheck(dealerPhone)==1){
            NSLog(@"Error !! Enter only 10 digit Nos for Phone no");
            exit(0);
        }
        if(alphabeticalCheck(dealerCity)==1){
            NSLog(@" Error !! Enter only alphabets for Dealer City");
            exit(0);
        }
        
        if(alphaNumericCheck(dealerAddress)==1){
            NSLog(@" Error !! Enter only Number and alphabets for Department Name");
            exit(0);
        }
        
        
        
        Dealer *dealer=[Dealer alloc];
        dealer.name=dealerName;
        dealer.address=dealerAddress;
        dealer.city=dealerCity;
        dealer.phone=dealerPhone;
        
        //Get the Department Details
        
        NSLog(@"Enter the Department Details");
        NSLog(@"Department Name(Only Alphabets):");
        scanf("%s",dName);
        NSLog(@"Phone No(Only Numbers up to 10 digits");
        scanf("%s",dPhone);
        
        
        NSString *deptName = [NSString stringWithUTF8String:dName];
        NSString *deptPhone= [NSString stringWithUTF8String:dPhone];
        
        if(alphabeticalCheck(deptName)==1){
            NSLog(@" Error !! Enter only alphabets for Department Name");
            exit(0);
        }
        if(phoneNumberCheck(deptPhone)==1){
            NSLog(@"Error !! Enter only 10 digit Nos for Phone no");
            exit(0);
        }
        
        Department *dept=[Department alloc];
        dept.name=deptName;
        dept.phone=deptPhone;
        dept.dealer=dealer;
        
        
        
        
        double miles,price;
        NSInteger vRating;
       
        
       
        
        BOOL value=YES;
        while(value){
            
            NSLog(@"1: Add a Vehicle  2: List Vehicle  3: Search Vehicle 4: Add Employee 5: List Employees");
            
            int option;
            scanf("%d",&option);
            
            switch(option){
                case 1:
                {
                    //Get the Vehicle Details
                    
                    NSLog(@"Enter the Vehicle Details");
                    NSLog(@"Vehicle Make(Only Alphabets):");
                    scanf("%s",vMake);
                    NSLog(@"Vehicle Model(Only Alphabets):");
                    scanf("%s",vModel);
                    NSLog(@"Vehicle Type(Only Alphabets):");
                    scanf("%s",veType);
                    NSLog(@"Miles(Only Decimals):");
                    scanf("%lf",&miles);
                    NSLog(@"Price(Only Decimals):");
                    scanf("%lf",&price);
                    NSLog(@"Vehicle Rating");
                    scanf("%li",&vRating);
                    
                    Vehicle *vehicle=[Vehicle alloc];
                    vehicle.make=[NSString stringWithUTF8String:vMake];
                    vehicle.model=[NSString stringWithUTF8String:vModel];
                    vehicle.type=[NSString stringWithUTF8String:veType];
                    vehicle.miles=[NSDecimalNumber decimalNumberWithDecimal:[[NSNumber numberWithDouble:miles]decimalValue]];
                    vehicle.price=[NSDecimalNumber decimalNumberWithDecimal:[[NSNumber numberWithDouble:price]decimalValue]];
                    vehicle.year=[NSDate date];
                    vehicle.rating=vRating;
                    vehicle.department=dept;
                    
                    [dept addVehicle:vehicle];
                    break;
                }
                case 2:
                {
                    //List the Vehicles
                    
                    [dept listVehicles];
                    break;
                }
                    
                case 3:
                {
                    //Search the Vehicles
                    
                    NSString *searchModel;
                    char model[2048]={ 0 };
                    NSLog(@"Enter the Vehicle Model");
                    scanf("%s",model);
                    searchModel=[NSString stringWithUTF8String:model];
                    NSMutableArray<Vehicle* >   *searchedVehicles=[[NSMutableArray<Vehicle* > alloc]init];
                    searchedVehicles=[dept searchVehicles:searchModel];
                    if(searchedVehicles!=nil){
                    for(Vehicle *veh in searchedVehicles){
                        NSLog(@"Vehicle Make %@",veh.make);
                        NSLog(@"Vehicle Model %@",veh.model);
                        NSLog(@"Vehicle Type %@",veh.type);
                        NSLog(@"%@",veh.price);
                        NSLog(@"%li",veh.rating);
                    }
                    }else{
                        NSLog(@"%@ Model Not Present",searchModel);
                    }
                    break;
                }
                    
                case 4:
                {
                    //Get the Employee Details
                    
                    NSLog(@"Enter the Employee Details");
                    NSLog(@"First Name(Only Alphabets):");
                    scanf("%s",eFirstName);
                    NSLog(@"Last Name(Only Alphabets):");
                    scanf("%s",eLastName);
                    NSLog(@"City(Only Alphabets):");
                    scanf("%s",eCity);
                    NSLog(@"Address(Only Alphabets):");
                    scanf("%s",eAddress);
                    NSLog(@"Phone(Only Numeric):");
                    scanf("%s",ePhone);
                    NSLog(@"Employee Zip(Only Numeric):");
                    scanf("%s",eZip);
                    NSLog(@"Employee SSN(Only Numeric):");
                    scanf("%s",eSSN);
                    
                    Employee *employee = [Employee alloc];
                    employee.firstName = [NSString stringWithUTF8String:eFirstName];
                    employee.LastName = [NSString stringWithUTF8String:eLastName];
                    employee.city = [NSString stringWithUTF8String:eCity];
                    employee.address = [NSString stringWithUTF8String:eAddress];
                    employee.phone = [NSString stringWithUTF8String:ePhone];
                    employee.zip = [NSString stringWithUTF8String:eZip];
                    employee.ssn = [NSString stringWithUTF8String:eSSN];
                    
                    [dept addEmployee:employee];
                    break;
                }
                    
                case 5:
                {
                    //List the Employees
                    
                    [dept listEmployees];
                    break;
                }
                
                default:
                {
                    NSLog(@"Incorrect Details entered");
                    break;
                }
         }
            
            int c;
            NSLog(@"Do you wish to continue 1-CONTINUE/0 - EXIT");
            scanf("%d",&c);
            NSLog(@"%d",c);
            if(c == 1)
                value=YES;
            else
                value=NO;
            
        }
    
      
     
      
    }
    return 0;
}

//Validation for Alphabets

int alphabeticalCheck(NSString *str){
    
    NSString *myregex = @"^[A-Za-z]+$";
    int i=0;
    NSPredicate *deptNameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", myregex];
    if (![deptNameTest evaluateWithObject:str])  {
        i=1;
    }
    return i;
    
}

//Validation for Phone Number

int phoneNumberCheck(NSString *phoneNo){
    
    NSString *phoneRegex = @"[0-9]{10}";
    NSPredicate *test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    BOOL matches = [test evaluateWithObject:phoneNo];
    int i=0;
    if(!matches){
        i=1;
    }
    return i;
}

//Validation for Alphanumeric

int alphaNumericCheck(NSString *str1){
    
    NSString *myregex = @"^[A-Za-z0-9 ]+$";
    int i=0;
    NSPredicate *deptNameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", myregex];
    if (![deptNameTest evaluateWithObject:str1])  {
        i=1;
    }
    return i;
}



