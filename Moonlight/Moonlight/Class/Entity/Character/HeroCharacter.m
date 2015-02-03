//
//  HeroCharacter.m
//  Moonlight
//
//  Created by 蝴蝶 on 15/1/9.
//  Copyright (c) 2015年 蝴蝶. All rights reserved.
//

#import "HeroCharacter.h"

@implementation HeroCharacter

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.spriteNode.texture = [SKTexture textureWithImageNamed:@"voilet.png"];
    }
    return self;
}

@end
