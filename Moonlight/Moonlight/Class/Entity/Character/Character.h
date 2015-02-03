//
//  Character.h
//  Moonlight
//
//  Created by 蝴蝶 on 15/1/9.
//  Copyright (c) 2015年 蝴蝶. All rights reserved.
//

#import "Entity.h"

@interface Character : Entity
{
    CGFloat _health;
    CGFloat _maxHealth;
    BOOL _death;
}


// 生命值
@property (nonatomic, readonly) CGFloat health;

// 生命值上限
@property (nonatomic, readonly) CGFloat maxHealth;

// 是否死亡
@property (nonatomic, readonly,getter=isDeath) BOOL death;


// 杀死角色
- (void)kill;

@end
