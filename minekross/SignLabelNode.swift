//
//  SignLabelNode.swift
//  minekross
//
//  Created by Tyler Helmrich on 5/13/18.
//  Copyright © 2018 Tyler Helmrich. All rights reserved.
//

import SpriteKit
import GameplayKit

class SignLabelNode: SKLabelNode{
    
    init(pos: CGPoint, text: String){
        super.init();
        self.position = pos;
        self.text = text;
        self.fontColor = UIColor.black;
        self.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center;
        self.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
