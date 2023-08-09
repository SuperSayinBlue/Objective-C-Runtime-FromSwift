//
//  main.swift
//  Client
//
//  Created by admin on 14/02/23.
//

import Foundation
//import ObjectiveC.runtime
import ObjectiveC

print("Hello, World!")
var DylibObj = DylibImport()
var su = DylibObj.sum(withFirst: 1000,second: 1000)
print(su)

/*
// Load the dynamic library
let libraryHandle = dlopen("/Users/admin/Documents/GIT/Mac codes/Dyna/Build/Products/Release/libDyna.dylib", RTLD_NOW)
if libraryHandle != nil {
    // Get a reference to the MyClass class
    let className = "MyClass"
    let objectiveCClass: AnyClass? = objc_getClass(className) as! AnyClass
    if let objectiveCClass = objectiveCClass {
        // Get the method signature for the doSomethingWithParam1:andParam2: method
        let methodName = "doSomethingWithParam1:andParam2:"
        let methodSelector = NSSelectorFromString(methodName)
        let method = class_getInstanceMethod(objectiveCClass, methodSelector)
        if method != nil {
            let methodSignature = method_getTypeEncoding(method!)
            
            // Create an instance of MyClass
            let objectiveCInstance = objectiveCClass.alloc()
            
            // Prepare the method arguments
            let params: [Any] = ["Hello, world!", 42]
            if params.count > 0 {
                let invocation = NSInvocation(methodSignature: methodSignature)
                invocation.selector = methodSelector
                invocation.target = objectiveCInstance
                for i in 0..<params.count {
                    var param = params[i]
                    invocation.setArgument(&param, at: i + 2)
                }
                
                // Invoke the method
                invocation.invoke()
                
                // Get the return value
                var returnValue: AnyObject?
                invocation.getReturnValue(&returnValue)
                
                // Print the return value
                if let returnValue = returnValue as? String {
                    print(returnValue)
                }
            }
            
            // Release the instance of MyClass
            objectiveCInstance.release()
        }
    }
    
    // Unload the dynamic library
    dlclose(libraryHandle)
}
*/



/*
let libraryHandle = dlopen("/Users/admin/Documents/GIT/Mac codes/Dyna/Build/Products/Release/libDyna.dylib", RTLD_NOW)
let className = "HttpHandlerExport"
let objectiveCClass: AnyClass? = objc_getClass(className) as! AnyClass
let methodName = "dum"
let methodSelector = Selector(methodName)
if let imp = class_getMethodImplementation(objectiveCClass, methodSelector) {
    typealias Function = @convention(c) (AnyObject, Selector) -> Void
    let function = unsafeBitCast(imp, to: Function.self)
    let objectiveCInstance = objectiveCClass.alloc()
    var i = function(objectiveCInstance, methodSelector)

    print(i)

}*/

