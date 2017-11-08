//
//  NSObject+Swizzling.h
//  CALayerDome
//
//  Created by Mobiyun on 2017/10/16.
//  Copyright © 2017年 Mobiyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSObject (Swizzling)

/**
 Runtime动态替换方法封装

 @param originalSelector 要替换的方法
 @param swizzledSelector 替换的方法
 */
+ (void)methodSwizzlingWithOriginalSelector:(SEL)originalSelector bySwizzledSelector:(SEL)swizzledSelector;
@end
