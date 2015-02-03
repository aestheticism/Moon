//
//  GameBaseScene.h
//  Moonlight
//
//  Created by 蝴蝶 on 15/1/15.
//  Copyright (c) 2015年 蝴蝶. All rights reserved.
//

#import "BaseScene.h"

typedef NS_ENUM(NSInteger, WorldLayer) {
    kWorldLayerGround = 0,
    kWorldLayerBelowCharacter,
    kWorldLayerCharacter,
    kWorldLayerAboveCharacter,
    kWorldLayerTop,
    kWorldLayerCount
}; /* 游戏世界层次 */

extern NSTimeInterval const kMinTimeInterval; /* 每次刷新的最小时间间隔(1.0f/60.0f) */
extern CGFloat const kWorldSizeFactor; /* 世界大小相对屏幕大小因数 */

// 屏幕大小
#define kScreenSize [[UIScreen mainScreen] bounds].size

// 世界大小
#define kWorldSize  CGSizeMake(kScreenSize.width * (1.0f + kWorldSizeFactor),kScreenSize.height * (1.0f + kWorldSizeFactor))
/* 游戏世界坐标相对屏幕的x方向偏移量 */
#define kWorldOffsetX (kScreenSize.width * kWorldSizeFactor)
/* 游戏世界坐标相对屏幕的y方向偏移量 */
#define kWorldOffsetY (kScreenSize.height * kWorldSizeFactor)

/* 加载资源完成后,回调程序块 */
typedef void (^AssetLoadCompletionHandler)(void);

@class Entity;

@interface GameBaseScene : BaseScene

@property (nonatomic,readonly) SKNode *world; // 世界节点

/*
 在后台加载场景所有的资源,在一个后台线程里调用+loadSceneAssets方法,加载完成后在主线程中调用callback
 */
+ (void)loadSceneAssetsWithCompletionHandler:(AssetLoadCompletionHandler)callback;

// 加载场景资源(由子类重写)
+ (void)loadSceneAssets;

// 释放场景资源(由子类重写)
+ (void)releaseSceneAssets;


// 移动世界层
- (void)moveWorldOnOffsetX:(CGFloat)offsetx;
- (void)moveWorldOnOffsetY:(CGFloat)offsety;
- (void)moveWorldOnPosition:(CGPoint)position;

/*
 每一帧执行一次,用来刷新场景
 @param timeSinceLast 距离上一帧的时间间隔
 */
- (void)updateWithTimeSinceLastUpdate:(CFTimeInterval)timeSinceLast;

/*
 添加一个node到世界上
 @param node 所要添加的node
 @param layer 世界层级
 */
- (void)addNode:(SKNode *)node atWorldLayer:(WorldLayer)layer;

/*
 添加一个实体到世界上
 @param entity 所要添加的实体
 @param layer 世界层级
 */
- (void)addEntity:(Entity *)entity atWorldLayer:(WorldLayer)layer;

@end
