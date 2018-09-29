//
//  Tool.swift
//  minekross
//
//  Created by Tyler Helmrich on 6/21/18.
//  Copyright © 2018 Tyler Helmrich. All rights reserved.
//

import SpriteKit
import GameplayKit

class Tool : SKNode{
    let tool: SKSpriteNode?;
    
    init(texture: SKTexture, size: CGSize){
        let xPosition : Double = Double(arc4random_uniform(625)) - 312.5;
        let yPosition : Double = (Double(arc4random_uniform(230)) + 320) * -1;
        let toolPoint : CGPoint = CGPoint(x: xPosition, y: yPosition);
        tool = SKSpriteNode(texture: texture, color: UIColor.black, size: size);
        tool?.position = toolPoint;
        tool?.zPosition = 0;
        
        super.init();
        self.addChild(tool!);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func getPosition() -> CGPoint{
        return self.position;
    }
    
}
