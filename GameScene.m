//
//  GameScene.m
//  JSGlitch
//
//  Created by JRamos on 8/2/14.
//  Copyright (c) 2014 Jonny Ramos. All rights reserved.
//

#import "GameScene.h"
#import "JSTileMap.h"

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */

    JSTileMap *test = [JSTileMap mapNamed:@"test.tmx"];
    [self addChild:test];
    test.position = CGPointMake(400, 200);
    
    SKAction *scrollLeft = [SKAction moveByX:-100 y:0 duration:2];
    SKAction *scrollRight = [SKAction moveByX:100 y:0 duration:2];
    SKAction *sequence = [SKAction sequence:@[scrollLeft, scrollRight]];
    SKAction *repeat  = [SKAction repeatActionForever:sequence];
    [test runAction:repeat];
    
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        
        sprite.xScale = 0.5;
        sprite.yScale = 0.5;
        sprite.position = location;
        
        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
        [sprite runAction:[SKAction repeatActionForever:action]];
        
        [self addChild:sprite];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
