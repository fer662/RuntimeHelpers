//
//  NSObject+RuntimeHelpers.m
//  RuntimeHelpers
//
//  Created by Fernando Mazzon on 4/30/13.
//  Copyright (c) 2013 Fernando Mazzon. All rights reserved.
//

#import "NSObject+RuntimeHelpers.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation NSObject (RuntimeHelpers)

+ (NSArray *)subclasses
{
    int numClasses = objc_getClassList(NULL, 0);
    Class *classes = NULL;
    
    classes = (Class *)malloc(sizeof(Class) * numClasses);
    numClasses = objc_getClassList(classes, numClasses);
    
    NSMutableArray *result = [NSMutableArray array];
    for (NSInteger i = 0; i < numClasses; i++)
    {
        Class superClass = classes[i];
        do {
            superClass = class_getSuperclass(superClass);
        } while(superClass && superClass != [self class]);
        
        if (superClass == nil) {
            continue;
        }
        
        [result addObject:classes[i]];
    }
    
    free(classes);
    
    return result;
}

+ (NSArray *)classesConformingToProtocol:(Protocol *)protocol
{
    int numClasses = objc_getClassList(NULL, 0);
    Class *classes = NULL;

    classes = (Class *)malloc(sizeof(Class) * numClasses);
    numClasses = objc_getClassList(classes, numClasses);
    
    NSMutableArray *result = [NSMutableArray array];
    for (NSInteger i = 0; i < numClasses; i++) {
        Class cls = classes[i];
        if (class_conformsToProtocol(cls, protocol)) {
            [result addObject:classes[i]];
        }
    }
    
    free(classes);
    
    return result;
}

- (id)associatedObjectForKey:(void *)key orBlockResult:(id(^)())block
{
    id value = objc_getAssociatedObject(self, key);
    if (!value) {
        value = block();
        objc_setAssociatedObject(self,
                                 key,
                                 value,
                                 OBJC_ASSOCIATION_RETAIN);
    }
    return value;
}

+ (void)swizzleClassMethod:(SEL)originalSelector withReplacement:(SEL)replacementSelector
{
	Method originalMethod = class_getClassMethod([self class], originalSelector);
	Method replacementMethod = class_getClassMethod([self class], replacementSelector);
	method_exchangeImplementations(replacementMethod, originalMethod);
}

+ (void)swizzleInstanceMethod:(SEL)originalSelector withReplacement:(SEL)replacementSelector
{
	Method originalMethod = class_getInstanceMethod([self class], originalSelector);
	Method replacementMethod = class_getInstanceMethod([self class], replacementSelector);
	method_exchangeImplementations(replacementMethod, originalMethod);
}

@end
