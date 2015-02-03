//
//  BFGraphicsUtilities.h
//  Moonlight
//
//  Created by 蝴蝶 on 15/1/15.
//  Copyright (c) 2015年 蝴蝶. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>


/* 随机生成一个在low和high之间的浮点数 */
CGFloat BFRandFloatBetweenNumbers(CGFloat low, CGFloat high);

/* 计算两点之间的距离 */
CGFloat BFDistanceBetweenPoints(CGPoint first, CGPoint second);

/* 计算两点斜率的角度 */
CGFloat BFRadiansBetweenPoints(CGPoint first, CGPoint second);

/* 计算两点的和 */
CGPoint BFPointByAddingCGPoints(CGPoint first, CGPoint second);


/* 从文理图册中加载帧数据，返回类型：数组 */
NSArray *BFLoadFramesFromAtlas(NSString *atlasName, NSString *baseFileName, int numberOfFrames);

/* 在一个时间段里，发射一次粒子 */
void BFRunOneShotEmitter(SKEmitterNode *emitter, CGFloat duration);

