//
//  SKEmitterNode+EmitterAdditions.m
//  Moonlight
//
//  Created by 蝴蝶 on 15/1/15.
//  Copyright (c) 2015年 蝴蝶. All rights reserved.
//

#import "SKEmitterNode+EmitterAdditions.h"

@implementation SKEmitterNode (EmitterAdditions)

+ (instancetype)emitterNodeWithEmitterNamed:(NSString *)emitterFileName {
    
    return [NSKeyedUnarchiver unarchiveObjectWithFile:[[NSBundle mainBundle]
                                                       pathForResource:emitterFileName
                                                       ofType:@"sks"]];
}

@end
