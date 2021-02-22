//
//  GameViewController.swift
//  SceneKitDemo
//
//  Created by Matt Maher on 2/21/21.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {

    var sceneView: SCNView!
    var scene: SCNScene!
    var cameraNode: SCNNode!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        sceneView = (view as! SCNView)
        
        setupScene()
    }
    
    func setupScene() {
        scene = SCNScene()
        sceneView.scene = scene
        
        setupCamera()
    }
    
    func setupCamera() {
        cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 5)
        scene.rootNode.addChildNode(cameraNode)
        
        addSquare()
    }
    
    func addSquare() {
        let geometry = SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0.0)
        let squareNode = SCNNode(geometry: geometry)
        scene.rootNode.addChildNode(squareNode)
    }

}
