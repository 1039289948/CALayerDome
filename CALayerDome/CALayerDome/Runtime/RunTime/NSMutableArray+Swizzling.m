//
//  NSMutableArray+Swizzling.m
//  CALayerDome
//
//  Created by Mobiyun on 2017/10/16.
//  Copyright © 2017年 Mobiyun. All rights reserved.
//

#import "NSMutableArray+Swizzling.h"
#import "NSObject+Swizzling.h"

@implementation NSMutableArray (Swizzling)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [objc_getClass("__NSArrayM") methodSwizzlingWithOriginalSelector:@selector(removeObject:) bySwizzledSelector:@selector(ex_removeObject:) ];
        [objc_getClass("__NSArrayM") methodSwizzlingWithOriginalSelector:@selector(addObject:) bySwizzledSelector:@selector(ex_addObject:)];
        [objc_getClass("__NSArrayM") methodSwizzlingWithOriginalSelector:@selector(removeObjectAtIndex:) bySwizzledSelector:@selector(ex_removeObjectAtIndex:)];
        [objc_getClass("__NSArrayM") methodSwizzlingWithOriginalSelector:@selector(insertObject:atIndex:) bySwizzledSelector:@selector(ex_insertObject:atIndex:)];
        [objc_getClass("__NSArrayM") methodSwizzlingWithOriginalSelector:@selector(objectAtIndex:) bySwizzledSelector:@selector(ex_objectAtIndex:)];
        [objc_getClass("__NSArrayM") methodSwizzlingWithOriginalSelector:@selector(objectAtIndexedSubscript:) bySwizzledSelector:@selector(ex_objectAtIndexedSubscript:)];
    });
}
- (void)ex_removeObject:(id)object{
    if (object == nil) {
        NSLog(@"%s call -removeObject:, but argument obj is nil", __FUNCTION__);
    } else {
        [self ex_removeObject:object];
    }
}

- (void)ex_addObject:(id)object{
    if (object == nil) {
        NSLog(@"%s can add nil object into NSMutableArray", __FUNCTION__);
    } else {
        [self ex_addObject:object];
    }
}

- (void)ex_removeObjectAtIndex:(NSUInteger)index {
    if (self.count <= 0) {
        NSLog(@"%s can't get any object from an empty array", __FUNCTION__);
        return;
    }
    if (index >= self.count) {
        NSLog(@"%s index out of bound", __FUNCTION__);
        return;
    }
    [self ex_removeObjectAtIndex:index];
}

- (void)ex_insertObject:(id)anObject atIndex:(NSUInteger)index {
    if (anObject == nil) {
        NSLog(@"%s can't insert nil into NSMutableArray", __FUNCTION__);
    } else if (index > self.count) {
        NSLog(@"%s index is invalid", __FUNCTION__);
    } else {
        [self ex_insertObject:anObject atIndex:index];
    }
}

- (id)ex_objectAtIndex:(NSUInteger)index {
    if (self.count == 0) {
        NSLog(@"%s can't get any object from an empty array", __FUNCTION__);
        return nil;
    }
    if (index > self.count) {
        NSLog(@"%s index out of bounds in array", __FUNCTION__);
        return nil;
    }
    return [self ex_objectAtIndex:index];
}

- (void)ex_objectAtIndexedSubscript:(NSInteger)index{
    if (self.count <= 0) {
        NSLog(@"%s can't get any object from an empty array", __FUNCTION__);
        return;
    }
    if (index >= self.count) {
        NSLog(@"%s index out of bound", __FUNCTION__);
        return;
    }
    [self ex_objectAtIndexedSubscript:index];
}

- (void)ex_setObject:(id)obj atIndexedSubscript:(NSInteger)index{
    
    if (obj == nil) {
        NSLog(@"%s can't insert nil into NSMutableArray", __FUNCTION__);
    } else if (self.count <= 0) {
        NSLog(@"%s can't get any object from an empty array", __FUNCTION__);
    } else if (index >= self.count) {
        NSLog(@"%s index out of bound", __FUNCTION__);
    } else {
        [self ex_setObject:obj atIndexedSubscript:index];
    }
}





@end
