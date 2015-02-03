//
//  BgNode.h
//  Moonlight
//
//  Created by 蝴蝶 on 15/1/15.
//  Copyright (c) 2015年 蝴蝶. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface BgNode : SKNode

// 滚动速度
@property (nonatomic, assign) CGFloat scrollSpeed;

- (void)updateWithTimeSinceLastUpdate:(CFTimeInterval)interval;

@end
