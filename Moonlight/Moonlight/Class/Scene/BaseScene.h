//
//  BaseScene.h
//  Moonlight
//
//  Created by 蝴蝶 on 15/1/14.
//  Copyright (c) 2015年 蝴蝶. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@class Entity;

@interface BaseScene : SKScene

@property (nonatomic, readonly) NSArray *entitys;

- (void)addEntity:(Entity *)entity;
- (void)removeEntity:(Entity *)entity;

@end
