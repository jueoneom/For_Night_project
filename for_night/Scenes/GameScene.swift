//
//  GameScene.swift
//  for_night
//
//  Created by JE on 2020/07/12.
//  Copyright © 2020 JE. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    //MARK: - Properties
    var ground: SKSpriteNode!
    var player: SKSpriteNode!
    var cameraNode = SKCameraNode()
    
    var cameraMovePointPerSecond: CGFloat = 450.0
    var lastUpdateTime:TimeInterval = 0.0
    var dt: TimeInterval = 0.0
    
    
    //MARK: - Systems
    
    override func didMove(to view: SKView){
        setupNodes()
    }
    
    override func update(_ currentTime: TimeInterval) {
        if lastUpdateTime > 0{
            dt = currentTime - lastUpdateTime
        }
        else{
            dt = 0
        }
        lastUpdateTime = currentTime
        moveCamera()
    }
}


//MARK: - Configurations
extension GameScene{
    func setupNodes(){
        createBG()
        createGround()
        createPlayer()
        setupCamera()
    }
    
    func createBG(){
        let bg = SKSpriteNode(imageNamed: "background")
        bg.anchorPoint = .zero
        bg.position = .zero
        bg.zPosition = -1.0
        addChild(bg)
    }
    
    func createGround(){
        for i in 0...2{
            ground = SKSpriteNode(imageNamed: "ground")
            ground.name = "Ground"
            ground.anchorPoint = .zero
            ground.zPosition = 1.0
            ground.position = CGPoint(x:CGFloat(i) * ground.frame.width, y: 0.0)
            addChild(ground)
        }
    }
    
    func createPlayer(){
        player = SKSpriteNode(imageNamed: "player")
        player.zPosition = 5.0
        player.position = CGPoint(x: frame.width/2.0 - 100.0, y: ground.frame.height + player.frame.height/2.0)
        
        addChild(player)
    }
    
    func setupCamera(){
        addChild(cameraNode)
        camera = cameraNode
        cameraNode.position = CGPoint(x: frame.midX, y: frame.midY)
    }
    
    func moveCamera(){
        let amountToMove = CGPoint(x: cameraMovePointPerSecond * CGFloat(dt), y: 0.0)
        cameraNode.position = CGPoint(x: cameraNode.position.x + amountToMove.x, y: cameraNode.position.y + amountToMove.y)
    }
}
