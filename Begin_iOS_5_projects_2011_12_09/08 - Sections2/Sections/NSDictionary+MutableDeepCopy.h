//
//  NSDictionary+MutableDeepCopy.h
//  Sections
//
//  Created by Dave Mark on 8/31/11.
//  Copyright (c) 2011 Dave Mark. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (MutableDeepCopy)
- (NSMutableDictionary *)mutableDeepCopy;
@end
