//
//  FlagPrefab.swift
//  minekross
//
//  Created by Tyler Helmrich on 5/10/18.
//  Copyright © 2018 Tyler Helmrich. All rights reserved.
//

import SpriteKit
import GameplayKit

class Flag: SKSpriteNode{
    
    init(parentSize : CGSize, color: UIColor, pos: CGPoint){
        super.init(texture: nil, color: color, size: CGSize(width:(parentSize.width/5),height:(parentSize.height/5)));
        self.position = pos;
        self.zPosition = -1;
        self.isHidden = true;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented");
    }
    
    public func setHidden(){
        self.isHidden = !self.isHidden;
    }
    
    public func setFlagFalse(){
        self.isHidden = true;
    }
    
}
