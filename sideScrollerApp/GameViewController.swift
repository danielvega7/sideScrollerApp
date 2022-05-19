//
//  GameViewController.swift
//  sideScrollerApp
//
//  Created by Daniel Vega on 5/12/22.
//

import UIKit
import SpriteKit
import GameplayKit
public class staticSecond {
    public static var second = 0
}
class GameViewController: UIViewController {
    var play : GameScene!
    @IBOutlet weak var scoreOutlet: UILabel!
    
    @IBOutlet weak var timerLabelOutlet: UILabel!
    var timer : Timer!
    var second = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameViewController.calculateSeconds), userInfo: nil, repeats: true)
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
                    UIDevice.current.setValue(value, forKey: "orientation")
        // Load 'GameScene.sks' as a GKScene. This provides gameplay related content
        // including entities and graphs.
        if let scene = GKScene(fileNamed: "GameScene") {
            if let sceneNode = scene.rootNode as! GameScene? {
                play = sceneNode
            }
            // Get the SKScene from the loaded GKScene
            if let sceneNode = scene.rootNode as! GameScene? {
                
                // Copy gameplay related content over to the scene
//                sceneNode.entities = scene.entities
//                sceneNode.graphs = scene.graphs
                
                // Set the scale mode to scale to fit the window
                sceneNode.scaleMode = .aspectFill
                
                // Present the scene
                if let view = self.view as! SKView? {
                    view.presentScene(sceneNode)
                    
                    view.ignoresSiblingOrder = true
                    
                    view.showsFPS = true
                    view.showsNodeCount = true
                }
            }
        }
       
    }
    @objc func calculateSeconds() {
        staticSecond.second += 1
        timerEvent()
        timerLabelOutlet.text = "Time: \(staticSecond.second)"
       
    }
    
    func stopTimerTest() {
      timer?.invalidate()
      timer = nil
      staticSecond.second = 0
    }
    
    func timerEvent() {
        
        if staticSecond.second > 60 {
            staticSecond.second = 0
        }
        else {
            
        }
        
         
    }
    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeRight
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    @IBAction func tapGestureAction(_ sender: UITapGestureRecognizer) {
        play.jump()
        
        scoreOutlet.text = String(play.score)
    }
    @IBAction func resetButtonAction(_ sender: UIButton) {
        play.reset()
        
    }
    
}
