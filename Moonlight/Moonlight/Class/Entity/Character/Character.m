//
//  Character.m
//  Moonlight
//
//  Created by 蝴蝶 on 15/1/9.
//  Copyright (c) 2015年 蝴蝶. All rights reserved.
//

#import "Character.h"

@implementation Character

@synthesize death = _death;
@synthesize health = _health;
@synthesize maxHealth = _maxHealth;


#pragma mark- Property

- (BOOL)isDeath {
    return _death;
}

#pragma mark- Kill

- (void)kill {
    [_spriteNode removeFromParent];
}

@end
