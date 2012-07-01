//
//  HelloWorldLayer.m
//  learnParallax
//
//  Created by Ignazio Calò on 6/17/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// HelloWorldLayer implementation
@implementation HelloWorldLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        // ask director the the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
        
        CCSprite *lev0 = [CCSprite spriteWithFile:@"liv_0.png"];
        CCSprite *lev1 = [CCSprite spriteWithFile:@"liv_1.png"];
        CCSprite *lev2 = [CCSprite spriteWithFile:@"liv_2.png"];
        CCSprite *lev3 = [CCSprite spriteWithFile:@"liv_3.png"];
                
        lev0.anchorPoint = CGPointMake(0, 0);
        lev1.anchorPoint = CGPointMake(0, 0);
        lev2.anchorPoint = CGPointMake(0, 0);
            lev3.anchorPoint = CGPointMake(0, 0);

        
        CCParallaxNode *paraNode  = [CCParallaxNode node];
        [paraNode addChild:lev0 z:0 parallaxRatio:CGPointMake(0.1f, 0) positionOffset:CGPointMake(0, 0)];
        
        [paraNode addChild:lev1 z:1 parallaxRatio:CGPointMake(0.2f, 0) positionOffset:CGPointMake(0, 60)];

		[paraNode addChild:lev2 z:2 parallaxRatio:CGPointMake(0.4f, 0) positionOffset:CGPointMake(0, 45)];
        
        [paraNode addChild:lev3 z:3 parallaxRatio:CGPointMake(1, 0) positionOffset:CGPointMake(0, -20)];
        
        [self addChild:paraNode z:0 tag:0001];
        
        CCMoveBy *move1 = [CCMoveBy actionWithDuration:2 position:CGPointMake(-160, 0)];
        CCMoveBy *move2 = [CCMoveBy actionWithDuration:2 position:CGPointMake(160, 0)];
        
        CCSequence *pingpong = [CCSequence actions:move1,move2, nil];
        CCRepeatForever *repeatPingpong = [CCRepeatForever actionWithAction:pingpong];
        [paraNode runAction:repeatPingpong];
	}
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
