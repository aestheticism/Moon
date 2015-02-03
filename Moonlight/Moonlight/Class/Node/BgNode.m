//
//  BgNode.m
//  Moonlight
//
//  Created by 蝴蝶 on 15/1/15.
//  Copyright (c) 2015年 蝴蝶. All rights reserved.
//

#import "BgNode.h"
#import "GameBaseScene.h"
#import "UIColor+BFColors.h"

@interface BgNode ()

// 底板
@property (nonatomic, strong) SKSpriteNode *bgSprite;

@end

@implementation BgNode

#pragma mark- Init

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self bgNodeInit];
    }
    return self;
}

- (void)bgNodeInit {
    
    // 底色
    [self bgSpriteInit];
}

- (void)bgSpriteInit {
    _bgSprite = [SKSpriteNode spriteNodeWithColor:[SKColor waveColor] size:kWorldSize];
    _bgSprite.position = CGPointMake(kWorldSize.width / 2,kWorldSize.height / 2 );
    _bgSprite.anchorPoint = CGPointMake(0.5f, 0.5f);
    
    [self addChild:_bgSprite];
}

#pragma mark- Update

- (void)updateWithTimeSinceLastUpdate:(CFTimeInterval)interval {
    
}

@end
