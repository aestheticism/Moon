//
//  SKEmitterNode+EmitterAdditions.h
//  Moonlight
//
//  Created by 蝴蝶 on 15/1/15.
//  Copyright (c) 2015年 蝴蝶. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface SKEmitterNode (EmitterAdditions)

/* 根据粒子文件名称，加载粒子 */
+ (instancetype)emitterNodeWithEmitterNamed:(NSString *)emitterFileName;

@end
