//
//  GameBaseScene.m
//  Moonlight
//
//  Created by 蝴蝶 on 15/1/15.
//  Copyright (c) 2015年 蝴蝶. All rights reserved.
//

#import "GameBaseScene.h"
#import "BFGraphicsUtilities.h"
#import "Entity.h"

// 每次刷新的最小时间间隔
NSTimeInterval const kMinTimeInterval = 1.0f / 60.0f;

/* 世界大小相对屏幕大小因数 */
CGFloat const kWorldSizeFactor = 0.0f;

@interface GameBaseScene ()

@property (nonatomic, strong) SKNode *world;
@property (nonatomic, strong) NSMutableArray *layers;
@property (nonatomic, assign) NSTimeInterval lastUpdateTimeInterval;

@end

@implementation GameBaseScene

- (instancetype)initWithSize:(CGSize)size {
    self = [super initWithSize:size];
    if (self) {
        // 创建世界层
        [self base_bulidWorld];
    }
    
    return self;
}

- (void)base_bulidWorld {
    _world = [[SKNode alloc] init];
    _world.name = @"world";
    _world.position = CGPointMake(-kWorldOffsetX / 2,-kWorldOffsetY / 2); // 居中世界坐标
    
    _layers = [NSMutableArray arrayWithCapacity:kWorldLayerCount];
    for (int i = 0; i < kWorldLayerCount; i++) {
        SKNode *layer = [[SKNode alloc] init];
        layer.zPosition = i - kWorldLayerCount;
        
        [_world addChild:layer];
        [_layers addObject:layer];
    }
    
    [self addChild:_world];
}

#pragma mark - Mapping

- (void)moveWorldOnOffsetX:(CGFloat)offsetx {
    [self moveWorldOnPosition:CGPointMake(offsetx, 0)];
}

- (void)moveWorldOnOffsetY:(CGFloat)offsety {
    [self moveWorldOnPosition:CGPointMake(0, offsety)];
}

- (void)moveWorldOnPosition:(CGPoint)position {
    CGPoint worldPoint = BFPointByAddingCGPoints(_world.position, position);
    
    if (worldPoint.x > 0) {
        worldPoint.x = 0;
    }
    
    if (worldPoint.x < -kWorldOffsetX) {
        worldPoint.x = -kWorldOffsetX;
    }
    
    if (worldPoint.y > 0) {
        worldPoint.y = 0;
    }
    
    if (worldPoint.y < -kWorldOffsetY) {
        worldPoint.y = -kWorldOffsetY;
    }
    
    _world.position = worldPoint;
}

#pragma mark - Loop Update

- (void)update:(NSTimeInterval)currentTime {
    CFTimeInterval timeSinceLast = currentTime - self.lastUpdateTimeInterval;
    self.lastUpdateTimeInterval = currentTime;
    
    if (timeSinceLast > 1) {
        timeSinceLast = kMinTimeInterval;
    }
    
    [self updateWithTimeSinceLastUpdate:timeSinceLast];
}

- (void)updateWithTimeSinceLastUpdate:(CFTimeInterval)timeSinceLast {
    // overridden by subclass
}

#pragma mark- Shared Assets

+ (void)loadSceneAssetsWithCompletionHandler:(AssetLoadCompletionHandler)callback {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        // 在后台加载资源.
        [self loadSceneAssets];
        
        if (!callback) {
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // 在主线程中调用回调方法
            callback();
        });
    });
}

+ (void)loadSceneAssets {
    // overridden by subclass
}

+ (void)releaseSceneAssets {
    // overridden by subclass
}

#pragma mark- Add Node To Scene

- (void)addNode:(SKNode *)node atWorldLayer:(WorldLayer)layer {
    SKNode *layerNode = self.layers[layer];
    [layerNode addChild:node];
}

- (void)addEntity:(Entity *)entity atWorldLayer:(WorldLayer)layer {
    SKNode *layerNode = self.layers[layer];
    [layerNode addChild:entity.spriteNode];
    [self addEntity:entity];
}

@end
