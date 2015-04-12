//
//  FISAppDelegate.m
//  ApplesAndHolidays
//
//  Created by Al Tyus on 5/30/14.
//  Copyright (c) 2014 com.flatironschool. All rights reserved.
//

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    return YES;
}

+ (NSMutableArray *)applePickerWithFruits:(NSMutableArray *)fruits
{
    NSString *apple = @"apple";
    NSPredicate *appicate = [NSPredicate predicateWithFormat:@"SELF == %@", apple];
    NSArray *applefiltered = [fruits filteredArrayUsingPredicate:appicate];
    NSMutableArray *apples = [NSMutableArray arrayWithArray:applefiltered];
    return apples;
}

+ (NSMutableDictionary *)holidaySupplies
{
    
    NSMutableDictionary *winter = [@{@"christmas" : [NSMutableArray arrayWithArray:@[@"Lights", @"Wreath"]], @"newYears" : [NSMutableArray arrayWithArray:@[@"Party Hats"]]} mutableCopy];
    
    NSMutableDictionary *summer = [@{@"fourthOfJuly" : [NSMutableArray arrayWithArray:@[@"Fireworks", @"BBQ"]]} mutableCopy];
   
    NSMutableDictionary *fall = [@{@"thanksgiving" : [NSMutableArray arrayWithArray:@[@"Turkey"]]} mutableCopy];
    
    NSMutableDictionary *spring = [@{@"memorialDay" : [NSMutableArray arrayWithArray:@[@"BBQ"]]} mutableCopy];
    
    return [NSMutableDictionary dictionaryWithDictionary:
            @{@"winter" : winter,
              @"summer" : summer,
              @"fall" : fall,
              @"spring" : spring}];
}

+ (NSString *)secondSupplyFourthOfJuly{
    return [self holidaySupplies][@"summer"][@"fourthOfJuly"][1];
}
+ (NSMutableDictionary *)addSupply:(NSString *)supply
                   toWinterHoliday:(NSString *)holiday
{
    NSMutableDictionary *winterSupplies = [self holidaySupplies];
    [winterSupplies[@"winter"][holiday] addObject:supply];
    return winterSupplies;
}

+ (NSMutableDictionary *)addSupplyToMemorialDay:(NSString *)supply{
    NSMutableDictionary *memorialSupply = [self holidaySupplies];
    [memorialSupply [@"spring"][@"memorialDay"] addObject:supply];
    return memorialSupply;
}

+ (NSMutableDictionary *)addHoliday:(NSString *)holiday toSeason:(NSString *)season withSupplies:(NSArray *)newHolidaySupplies
{
    NSMutableDictionary *newHoly = [self holidaySupplies];
    newHoly [season][holiday]= newHolidaySupplies;
    return newHoly;
}



@end