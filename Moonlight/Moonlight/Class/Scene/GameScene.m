//
//  GameScene.m
//  Moonlight
//
//  Created by 蝴蝶 on 15/1/15.
//  Copyright (c) 2015年 蝴蝶. All rights reserved.
//

#import "GameScene.h"

#import "HeroCharacter.h"
#import "BgNode.h"

static CGFloat const kHeroMoveFactor = 1.0f;

@interface GameScene ()<SKPhysicsContactDelegate>

@property (nonatomic, strong) HeroCharacter *hero;
@property (nonatomic, strong) BgNode *groundNode;
@property (nonatomic, assign) CGPoint beganPoint;

@end

@implementation GameScene

- (instancetype)initWithSize:(CGSize)size {
    self = [super initWithSize:size];
    if (self) {
        // 设置世界重力
        self.physicsWorld.gravity = CGVectorMake(0, 0);
        // 碰撞检测代理
        self.physicsWorld.contactDelegate = self;
        
        // 创建世界
        [self buildWorld];
    }
    
    return self;
}

#pragma mark- Build The World

- (void)buildWorld {
    // 添加背景
    [self addGround];
    
    // 添加英雄
    [self addHero];
}

- (void)addGround {
    _groundNode = [BgNode node];
    
    [self addNode:_groundNode atWorldLayer:kWorldLayerGround];
}

- (void)addHero {
    _hero = [HeroCharacter entity];
    _hero.spriteNode.size = CGSizeMake(60, 60);
    _hero.spriteNode.position = CGPointMake(kWorldSize.width / 2, (_hero.spriteNode.size.height + kWorldOffsetY) / 2);;
    
    [self addEntity:_hero atWorldLayer:kWorldLayerCharacter];
    
}

#pragma mark- Loop Update

- (void)updateWithTimeSinceLastUpdate:(CFTimeInterval)timeSinceLast {
    [super updateWithTimeSinceLastUpdate:timeSinceLast];
}

- (void)didSimulatePhysics {
    
}

- (void)didFinishUpdate {
    
}

#pragma mark- Touch For Move Hero

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch  = [touches anyObject];
    self.beganPoint = [touch locationInNode:self];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    
    CGPoint location = [touch locationInNode:self];
    CGFloat xMoveLength = self.beganPoint.x - location.x;
    CGFloat yMoveLength = self.beganPoint.y - location.y;
    
    CGFloat newPosX = _hero.spriteNode.position.x - xMoveLength * kHeroMoveFactor;
    CGFloat newPosY = _hero.spriteNode.position.y - yMoveLength * kHeroMoveFactor;
    CGPoint heroNewPos = CGPointMake(newPosX, newPosY);
    
    // 计算玩家精灵x，y方向边界值
    CGFloat max_x = kWorldSize.width - _hero.spriteNode.size.width * 0.25f;
    CGFloat min_x = _hero.spriteNode.size.width * 0.25f;
    
    CGFloat max_y = kWorldSize.height - (_hero.spriteNode.size.height) * 0.75f - kWorldOffsetY * 0.5f;
    CGFloat min_y = (_hero.spriteNode.size.height) * 0.75f + kWorldOffsetY * 0.5f;
    
    // 超过边界处理
    if (heroNewPos.x >= max_x)
    {
        heroNewPos.x = max_x;
    }
    else if (heroNewPos.x <= min_x)
    {
        heroNewPos.x = min_x;
    }
    
    if (heroNewPos.y >= max_y)
    {
        heroNewPos.y = max_y;
    }
    else if (heroNewPos.y <= min_y)
    {
        heroNewPos.y = min_y;
    }
    
    // 设置英雄新的坐标
    _hero.spriteNode.position = heroNewPos;
    self.beganPoint = location;
    
    // 移动世界层
    CGFloat offsetFactor = kWorldOffsetX / (kWorldSize.width  - _hero.spriteNode.size.width * 0.5f);
    CGFloat offsetX = xMoveLength * offsetFactor;
    
    [self moveWorldOnOffsetX:offsetX];
}

#pragma mark- Physics Contact Delegate

- (void)didBeginContact:(SKPhysicsContact *)contact {
    
}

- (void)didEndContact:(SKPhysicsContact *)contact {
    
}

#pragma mark- Shared Assets

+ (void)loadSceneAssets {
    
}

@end
