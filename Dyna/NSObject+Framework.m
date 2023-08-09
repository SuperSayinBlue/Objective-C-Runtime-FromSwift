//
//  NSObject+Framework.m
//  Dyna
//
//  Created by admin on 14/02/23.
//

#import "NSObject+Framework.h"

@implementation Framework : NSObject

- (int) Sum
{
    return i;
}


-(id) init{
    self = [super init];
    NSLog(@"innside innit");
    
    if(self){
        return self;
    }
    else{
        return nil;
    }
}

- (int) sumWithFirst:(int)j Second:( int)k {
    i = 7;
    return j+k;
}

- (NSString *)doSomethingWithParam1:(NSString *)param1 andParam2:(int)param2 {
    NSString *result = [NSString stringWithFormat:@"%@ %d", param1, param2];
    
    return result;
}

@end
