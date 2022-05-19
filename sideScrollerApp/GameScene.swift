//
//  GameScene.swift
//  sideScrollerApp
//
//  Created by Daniel Vega on 5/12/22.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    var score = 0
    var ball : SKSpriteNode!
    let cam = SKCameraNode()
    override func sceneDidLoad() {
        physicsWorld.contactDelegate = self
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        self.camera = cam
        print(ball.position)
    }
    
    override func update(_ currentTime: TimeInterval) {
        cam.position = ball.position
    }
    func jump() {
        ball.physicsBody?.velocity = CGVector(dx: 300, dy: 500)
    }
    func reset(){
        let body = ball.physicsBody
        ball.physicsBody = nil
        ball.position = CGPoint(x: -634.5, y: -45.024)
        ball.physicsBody = body
        ball.physicsBody?.velocity = CGVector(dx: 300, dy: 0)
        staticSecond.second = 0
        score = 0
    }
    func didBegin(_ contact: SKPhysicsContact){
        if (contact.bodyA.node?.name == "ball" && contact.bodyB.node?.name == "obstacle") || (contact.bodyB.node?.name == "ball" && contact.bodyA.node?.name == "obstacle") {
          reset()
            
            
        }
        else if (contact.bodyA.node?.name == "ball" && contact.bodyB.node?.name == "coin") || (contact.bodyB.node?.name == "ball" && contact.bodyA.node?.name == "coin") {
          score += 100
        
        }
        
    }
}
