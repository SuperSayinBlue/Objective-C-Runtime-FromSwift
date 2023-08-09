//
//  DCUtilsHelper.h
//  bspAgent
//
//  Created by admin on 14/02/23.
//

#ifndef DCUtilsHelper_h
#define DCUtilsHelper_h

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef long long int DWORD;

@interface DylibImport : NSObject
{
    id m_Instance;
}

- (int) dum;

- (int) sumWithFirst:(int)j Second:(int)k ;


@end


@interface CustomObject : NSObject

@property (strong, nonatomic) id someProperty;

- (void) someMethod;
- (int) sum:( int) j :( int)k ;
@end


#endif /* DCUtilsHelper_h */

NS_ASSUME_NONNULL_END
