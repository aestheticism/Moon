//
//  Entity.m
//  Moonlight
//
//  Created by 蝴蝶 on 15/1/9.
//  Copyright (c) 2015年 蝴蝶. All rights reserved.
//

#import "Entity.h"

@interface Entity ()

// 精灵节点,用来显示实体(默认为黑色块)
@property (strong,nonatomic) SKSpriteNode *spriteNode;

@end

@implementation Entity

@synthesize spriteNode = _spriteNode;
@synthesize name = _name;
@synthesize info = _info;

+ (instancetype)entity {
    return [[[self class] alloc] init];
}

#pragma mark- Init

- (instancetype)init
{
    self = [super init];
    if (self) {
        _name = nil;
        _spriteNode = [SKSpriteNode spriteNodeWithColor:[UIColor blackColor] size:CGSizeZero];
    }
    return self;
}
#pragma mark- NSCoding

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.spriteNode = [aDecoder decodeObjectForKey:@"spriteNode"];
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.info = [aDecoder decodeObjectForKey:@"info"];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_spriteNode forKey:@"spriteNode"];
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeObject:_info forKey:@"info"];
}

#pragma mark- NSCopying

- (id)copyWithZone:(NSZone *)zone {
    
    Entity *entity = [[self class] allocWithZone:zone];
    entity.name = [_name copy];
    entity.spriteNode = [_spriteNode copy];
    entity.info = [_info copy];
    
    return  entity;
}

#pragma mark- NSMutableCopy

- (id)mutableCopyWithZone:(NSZone *)zone {
    
    Entity *entity = [[self class] allocWithZone:zone];
    entity.name = [_name mutableCopy];
    entity.spriteNode = [_spriteNode mutableCopy];
    entity.info = [_info mutableCopy];
    
    return  entity;
}

@end