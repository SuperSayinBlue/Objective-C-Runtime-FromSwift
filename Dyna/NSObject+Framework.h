//
//  NSObject+Framework.h
//  Dyna
//
//  Created by admin on 14/02/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Framework : NSObject
{
    int i;
}

-(id) init;
- (int) Sum;
- (int) sumWithFirst:( int)j Second:( int)k ;
- (NSString *)doSomethingWithParam1:(NSString *)param1 andParam2:(int)param2;
@end

NS_ASSUME_NONNULL_END
