//
//  GameScene.swift
//  minekross
//
//  Created by Tyler Helmrich on 5/10/18.
//  Copyright © 2018 Tyler Helmrich. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
//    private var testPlot : PlotNode?;
    private var weedFlagButton: SKSpriteNode?;
    private var yellowFlagButton: SKSpriteNode?;
    private var greenFlagButton: SKSpriteNode?;
    private var purpleFlagButton: SKSpriteNode?;
    private var life1: SKSpriteNode?;
    private var life2: SKSpriteNode?;
    private var life3: SKSpriteNode?;
    private var scoreLabel: SKLabelNode?;
    private var score: Int?;
    private var levelScore: Int?;
    private var totalScore: Int?;
    private var isWeedFlagged: Bool?;
    private var isYellowFlagged: Bool?;
    private var isGreenFlagged: Bool?;
    private var isPurpleFlagged: Bool?;
    private var garden: [[PlotNode]] = [];
    private var level: Int?;
    private var lives: Int?;
    
    
    
    override func didMove(to view: SKView) {
        weedFlagButton = self.childNode(withName: "weedFlagButton") as? SKSpriteNode;
        yellowFlagButton = self.childNode(withName: "yellowFlagButton") as? SKSpriteNode;
        greenFlagButton = self.childNode(withName: "greenFlagButton") as? SKSpriteNode;
        purpleFlagButton = self.childNode(withName: "purpleFlagButton") as? SKSpriteNode;
        life1 = self.childNode(withName: "life1") as? SKSpriteNode;
        life2 = self.childNode(withName: "life2") as? SKSpriteNode;
        life3 = self.childNode(withName: "life3") as? SKSpriteNode;
        scoreLabel = self.childNode(withName: "scoreLabel") as? SKLabelNode;
        isWeedFlagged = false;
        isYellowFlagged = false;
        isGreenFlagged = false;
        isPurpleFlagged = false;
        level = 1;
        lives = 3;
        
        initGame(carryScore: 0, level: level!);

        self.backgroundColor = UIColor.white;
    }
    
    func initGame(carryScore: Int, level:Int){
        scoreLabel?.text = String(carryScore);
        score = carryScore;
        totalScore = 1;
        levelScore = 1;
        var twoPercent: Int = -1;
        var numWeeds: Int = -1;
        var specialVal: Int = -1;
        
        switch level {
        case 1:
            twoPercent = 100;
            numWeeds = 6;
            specialVal = 32;
        case 2:
            twoPercent = 80;
            numWeeds = 6;
            specialVal = 48;
        case 3:
            twoPercent = 60;
            numWeeds = 7;
            specialVal = 72;
        case 4:
            twoPercent = 40;
            numWeeds = 7;
            specialVal = 108;
        case 5:
            twoPercent = 20;
            numWeeds = 8;
            specialVal = 162;
        case 6:
            twoPercent = 12;
            numWeeds = 9;
            specialVal = 243;
        case 7:
            twoPercent = 17;
            numWeeds = 9;
            specialVal = 486;
        case 8:
            twoPercent = 29;
            numWeeds = 10;
            specialVal = 972;
        case 9:
            twoPercent = 37;
            numWeeds = 11;
            specialVal = 1944;
        case 10:
            twoPercent = 25;
            numWeeds = 12;
            specialVal = 2916;
        case 11:
            twoPercent = 25;
            numWeeds = 13;
            specialVal = 4374;
        case 12:
            twoPercent = 25;
            numWeeds = 14;
            specialVal = 6561;
        default:
            twoPercent = -1;
            numWeeds = -1;
            specialVal = -1;
        }
        
        print(String(specialVal));
        print(String(numWeeds));
        print(String(twoPercent));
        
        initWholeGarden();
        initGarden(specVal: specialVal, twoPrcnt: twoPercent);
        initWeeds(numWeeds: numWeeds);
        initSigns();
    }
    
    func resetGame(){
        garden = [];
        self.removeAllChildren();
        self.insertChild(weedFlagButton!, at: 0);
        self.insertChild(yellowFlagButton!, at: 1);
        self.insertChild(greenFlagButton!, at: 2);
        self.insertChild(purpleFlagButton!, at: 3);
        self.insertChild(scoreLabel!, at: 4);
        self.insertChild(life1!, at: 5);
        self.insertChild(life2!, at: 6);
        self.insertChild(life3!, at: 7);
    }
    
    func updateLives(remainingLives: Int){
        switch remainingLives {
        case 3:
            life3?.alpha = 1.0;
            life2?.alpha = 1.0;
            life1?.alpha = 1.0;
        case 2:
            life3?.alpha = 0.0;
            life2?.alpha = 1.0;
            life1?.alpha = 1.0;
        case 1:
            life3?.alpha = 0.0;
            life2?.alpha = 0.0;
            life1?.alpha = 1.0;
        case 0:
            life3?.alpha = 0.0;
            life2?.alpha = 0.0;
            life1?.alpha = 0.0;
        default:
            print("remainingLives was a value less than 0 or greater than 3");
        }
    }
    
    func initWholeGarden(){
        let sixth: CGFloat = ((self.size.width) / 6);
        let wholeSize: CGFloat = sixth * 5;
        
        let x: CGFloat = -1 * (sixth/2);
        let y: CGFloat = 3 * (sixth/2);
        
        let patchTexture: SKTexture = SKTexture(image: #imageLiteral(resourceName: "HDDirtPatch"));
        let garden: SKSpriteNode = SKSpriteNode(texture: patchTexture, size: CGSize(width: wholeSize, height: wholeSize));
        garden.position = CGPoint(x: x, y: y);
        garden.zPosition = -2;
        self.insertChild(garden, at: 0)
        
        
    }
    
    func initGarden(specVal: Int, twoPrcnt: Int){
        let plotSize: CGFloat = ((self.size.width)/6);
        var x: CGFloat = -5 * (plotSize/2);
        var y: CGFloat = 7 * (plotSize/2);
        var index: Int = 0;
        var gardenRow: [PlotNode] = [];
        
        while(index != 25){
            let tempPlot: PlotNode = PlotNode(value: 1, pos: CGPoint(x: x, y: y), size: CGSize(width: plotSize, height: plotSize));
            self.insertChild(tempPlot, at: index);
            gardenRow.append(tempPlot);
            
            index += 1;
            if(index % 5 == 0 && index != 0){
                y -= plotSize;
                x = -5 * (plotSize/2);
                garden.append(gardenRow);
                gardenRow = [];
            }else{
                x += plotSize;
            }
        }
        makeDifficulty(specialsVal: specVal, twoPercent: twoPrcnt);
    }
    
    func initWeeds(numWeeds: Int){
        var weeds: Int = numWeeds;
        while(weeds != 0){
            let r: Int = Int(arc4random_uniform(5));
            let c: Int = Int(arc4random_uniform(5));
            
            if(garden[r][c].getValue() == 1){
                garden[r][c].setValue(val: 0);
                weeds -= 1;
            }
        }
    }
    
    func initSigns(){
        let plotSize: CGFloat = ((self.size.width)/6);
        var x: CGFloat = 5 * (plotSize/2);
        var y: CGFloat = 7 * (plotSize/2);
        var index: Int = 26;
        var columnVals: [Int] = [0,0,0,0,0];
        var columnWeeds: [Int] = [0,0,0,0,0];
        
        for gardenRow in garden{
            var rowVal: Int = 0;
            var rowWeeds: Int = 0;
            var column: Int = 0;
            
            for plot in gardenRow{
                rowVal += plot.getValue();
                columnVals[column] += plot.getValue();
                
                if(plot.getValue() == 0){
                    rowWeeds += 1;
                    columnWeeds[column] += 1;
                }
                column += 1;
            }
            
            let tempSign = SignNode(pos: CGPoint(x: x, y: y), val: rowVal, weed: rowWeeds, size: CGSize(width: plotSize, height: plotSize));
            self.insertChild(tempSign, at: index);
            y -= plotSize;
            index += 1;
        }
        
        x = -5 * (plotSize/2);
        
        for i in 0...4 {
            let val: Int = columnVals[i];
            let weed: Int = columnWeeds[i];
            
            let tempSign = SignNode(pos: CGPoint(x: x, y: y), val: val, weed: weed, size: CGSize(width: plotSize, height: plotSize));
            self.insertChild(tempSign, at: index);
            x += plotSize;
            index += 1;
        }
    }
    
    func makeDifficulty(specialsVal: Int, twoPercent: Int){
        let specials: Int = specialsVal;
        while(specials > totalScore!){
            let r: Int = Int(arc4random_uniform(5));
            let c: Int = Int(arc4random_uniform(5));
            
            if(garden[r][c].getValue() == 1){
                let n: Int = Int(arc4random_uniform(100));
                var spec: Int;
                if(n > twoPercent){
                    spec = 3;
                }else{
                    spec = 2;
                }
                garden[r][c].setValue(val: spec);
                totalScore = totalScore! * spec;
            }
        }
    }
    
    
    func touchDown(atPoint pos : CGPoint) {

    }
    
    func touchMoved(toPoint pos : CGPoint) {

    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            let plot = (atPoint(t.location(in: self)));
            var temp: SKNode;
            var temp1: PlotNode;
            if(plot is Touch){
                temp = plot.parent!;
                temp1 = temp as! PlotNode;
                if(!temp1.getFlipped()){
                    if(isWeedFlagged!){
                        temp1.setFlag(color: 0);
                    }
                    if(isYellowFlagged!){
                        temp1.setFlag(color: 1);
                    }
                    if(isGreenFlagged!){
                        temp1.setFlag(color: 2);
                    }
                    if(isPurpleFlagged!){
                        temp1.setFlag(color: 3);
                    }
                    if(!isWeedFlagged! && !isYellowFlagged! && !isGreenFlagged! && !isPurpleFlagged!){
                        let n = temp1.flipNode();
                        if(n == 0){
                            if(level! != 1){
                                level = level! - 1;
                            }
                            if(lives! > 0){
                                lives = lives! - 1;
                            }
                            let floatScore = Double(score!) * 0.67;
                            score = Int(floatScore.rounded());
                            updateLives(remainingLives: lives!);
                            resetGame();
                            initGame(carryScore: score!, level: level!);
                        }else{
                            levelScore = levelScore! * n;
                            totalScore = totalScore! / n;
                            if(totalScore == 1){
                                score = score! + levelScore!;
                                level = level! + 1;
                                resetGame();
                                initGame(carryScore: score!, level: level!);
                            }
                        }
                    }
                }
            }else if(plot === weedFlagButton){
                isWeedFlagged = !isWeedFlagged!;
                if(isWeedFlagged!){
                    weedFlagButton?.alpha = 0.5;
                }else{
                    weedFlagButton?.alpha = 1.0;
                }
            }else if(plot === yellowFlagButton){
                isYellowFlagged = !isYellowFlagged!;
                if(isYellowFlagged!){
                   yellowFlagButton?.alpha = 0.5;
                }else{
                    yellowFlagButton?.alpha = 1.0;
                }
            }else if(plot === greenFlagButton){
                isGreenFlagged = !isGreenFlagged!;
                if(isGreenFlagged!){
                    greenFlagButton?.alpha = 0.5;
                }else{
                    greenFlagButton?.alpha = 1.0;
                }
            }else if(plot === purpleFlagButton){
                isPurpleFlagged = !isPurpleFlagged!;
                if(isPurpleFlagged!){
                    purpleFlagButton?.alpha = 0.5;
                }else{
                    purpleFlagButton?.alpha = 1.0;
                }
            }else{
                print(type(of: plot));
            }
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
