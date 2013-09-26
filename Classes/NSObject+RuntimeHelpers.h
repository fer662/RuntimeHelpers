//
//  NSObject+RuntimeHelpers.h
//  RuntimeHelpers
//
//  Created by Fernando Mazzon on 4/30/13.
//  Copyright (c) 2013 Fernando Mazzon. All rights reserved.
//

@interface NSObject (RuntimeHelpers)

/**
 Returns an array of Class objects which are all subclasses to the NSObject class this is called on
 */
+ (NSArray *)subclasses;

/**
 Returns an array of Class objects containing all classes that implement a protocol
 */
+ (NSArray *)classesConformingToProtocol:(Protocol *)protocol;

/**
 returns the associated object for a key on the callee, and if unset, will set it to the result
 of the passed block and return it
 */
- (id)associatedObjectForKey:(void *)key orBlockResult:(id(^)())block;

/**
 Sets an object for a key in the callee, using OBJC_ASSOCIATION_RETAIN
 */
- (void)setAssociatedObject:(id)object forKey:(void *)key;

/**
 Exchange method implementations for instance methods
 */
+ (void)swizzleInstanceMethod:(SEL)originalSelector withReplacement:(SEL)replacementSelector;

/**
 Exchange method implementations for class methods
 */
+ (void)swizzleClassMethod:(SEL)originalSelector withReplacement:(SEL)replacementSelector;

/**
 Add method implementations for instance methods
 */
+ (BOOL)addInstanceMethod:(SEL)originalSelector method:(SEL)method;

@end
