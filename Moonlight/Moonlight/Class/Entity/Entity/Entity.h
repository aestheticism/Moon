//
//  Entity.h
//  Moonlight
//
//  Created by 蝴蝶 on 15/1/9.
//  Copyright (c) 2015年 蝴蝶. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface Entity : NSObject<NSCopying,NSMutableCopying,NSCoding>

// 精灵节点,用来显示实体(默认为黑色块)
@property (nonatomic,readonly) SKSpriteNode *spriteNode;

// 实体名称,默认为nil
@property (nonatomic,readwrite,copy) NSString *name;

// 实体信息,默认为nil
@property (nonatomic,copy) NSString *info;

@end

