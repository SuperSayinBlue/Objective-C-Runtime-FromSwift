//
//  DCUtilsHelper.m
//  bspAgent
//
//  Created by admin on 14/02/23.
//

#import <Foundation/Foundation.h>
#import "UtilsHelper.h"
#import <objc/runtime.h>
#import <dlfcn.h>

static Class Http_class;
static void* lib_handle;

@implementation DylibImport

- (int) dum {
    
    /*
    lib_handle = dlopen("libDyna.dylib", RTLD_LOCAL);
    if (!lib_handle) {
       NSLog(@"[%s] main: Unable to open library: %s\n",
       __FILE__, dlerror());
       exit(EXIT_FAILURE);
    }
*/
    // Get the Person class (required with runtime-loaded libraries).
    Http_class = NSClassFromString(@"Framework");
    if (!Http_class) {
       NSLog(@"[%s] main: Unable to get Person class", __FILE__);
       exit(EXIT_FAILURE);
    }
    
    SEL selector = NSSelectorFromString(@"Sum");
    int j =  [Http_class performSelector:(selector)];
   
    return j;
}

- (int) sumWithFirst:(int)j Second:(int)k {
    
    NSLog(@"Inside sumWithFirst");
    lib_handle = dlopen("libDyna.dylib", RTLD_LOCAL);
    if (!lib_handle) {
       NSLog(@"[%s] main: Unable to open library: %s\n",
       __FILE__, dlerror());
       exit(EXIT_FAILURE);
    }
    
    int ret = 0;
   /*
    Class objectiveCClass = NULL;
    
    [self callClassFunc:@"Framework" ObjClass: objectiveCClass IsInstance :true MethodName:@"sumWithFirst:Second:" Params: NULL IsIntorString:true RetValueString:NULL RetValueInt:&ret];
    */
    
    NSString* className = @"Framework";
    Class objectiveCClass = objc_getClass([className UTF8String]);
    if (objectiveCClass == NULL) {
        NSLog(@"[%s] main: Unable to get Person class", __FILE__);
        return 0;
    }
    
    NSString* methodName = @"sumWithFirst:Second:";
    SEL methodSelector = NSSelectorFromString(methodName);
    Method method = class_getInstanceMethod(objectiveCClass, methodSelector);
    if (!method) {
        NSLog(@"Error getting method reference for %@", methodName);
    }
    else
    {
        const char* methodSignature = method_getTypeEncoding(method);
        id objectiveCInstance = [objectiveCClass alloc];
        //NSArray* params = @[@1, @42];
        
        
       // if (params) {
            NSInvocation* invocation = [NSInvocation invocationWithMethodSignature:[NSMethodSignature signatureWithObjCTypes:methodSignature]];
            [invocation setSelector:methodSelector];
            [invocation setTarget:objectiveCInstance];
           /* for (int i = 0; i < params.count; i++) {
                id param = params[i];
                [invocation setArgument:&param atIndex:i + 2];
            }  */
            
            [invocation setArgument:&j atIndex:2];
            [invocation setArgument:&k atIndex:3];
            [invocation invoke];
 
            [invocation getReturnValue:&ret];
       // }
          
    }

    dlclose(lib_handle);
    return ret;
}
    
@end

/*
- (void) callClassFunc: (NSString *) ClassName ObjClass: (Class) objectiveCClass IsInstance : (BOOL) isNewInstance MethodName : (NSString*) methodName Params : (NSArray *) Params IsIntorString : (BOOL) isInt RetValueString: (NSString **) retString RetValueInt: (DWORD **) retInt
{
    if (objectiveCClass == NULL)
    {
        objectiveCClass = objc_getClass([ClassName UTF8String]);
        if (objectiveCClass == NULL) {
            NSLog(@"HttpHandlerExport: Unable to get dcSendData class");
            return;
        }
    }

    SEL methodSelector = NSSelectorFromString(methodName);
    Method method = class_getInstanceMethod(objectiveCClass, methodSelector);
    if (!method) {
        NSLog(@"HttpHandlerExport: Error getting method reference for %@", methodName);
    }
    else
    {
        const char* methodSignature = method_getTypeEncoding(method);
        
        id objectiveCInstance = nil;
        
        if(isNewInstance){
            m_Instance = NULL;
            m_Instance = [[objectiveCClass alloc] init];
        }
   
        if (objectiveCInstance == nil){
            NSLog(@"HttpHandlerExport: Unable to create instance class");
        }
        
        //NSArray* params = @[@1, @42];

        NSInvocation* invocation = [NSInvocation invocationWithMethodSignature:[NSMethodSignature signatureWithObjCTypes:methodSignature]];
        [invocation setSelector:methodSelector];
        [invocation setTarget:m_Instance];
        
        if(Params)
        {
            for (int i = 0; i < Params.count; i++) {
                id param = Params[i];
                [invocation setArgument:&param atIndex:i + 2];
            }
        }
        
        [invocation invoke];
        
        if(isInt)
        {
            [invocation getReturnValue:&retString];
        }else
        {
            [invocation getReturnValue:&retString];
        }

    }
    return;
}
*/
    



@implementation CustomObject

- (void) someMethod {
    NSLog(@"SomeMethod Ran");
}

- (int) sumWithFirst:( int)j Second:( int)k {
    
    return j+k;
}

@end
