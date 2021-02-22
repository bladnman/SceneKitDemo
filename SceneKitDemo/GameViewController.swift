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
        
        sceneView.showsStatistics = true
        sceneView.allowsCameraControl = true
        sceneView.autoenablesDefaultLighting = true
        
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
        cameraNode.position = SCNVector3(0, 0, 5)
        scene.rootNode.addChildNode(cameraNode)
        
        addSquare()
//        addSphere()
    }
    
    func addSquare() {
        let geometry = SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0.0)
        let node = SCNNode(geometry: geometry)
        node.physicsBody = SCNPhysicsBody(type: .dynamic, shape: nil)
        scene.rootNode.addChildNode(node)
        
        let force = SCNVector3(0, 10, 0)
        let forcePos = SCNVector3(0.05, 0.05, 0.05)
//        node.physicsBody?.applyForce(force, asImpulse: true)
        node.physicsBody?.applyForce(force, at:forcePos, asImpulse: true)
        
        let torqueForce = SCNVector4(0, 0, 1, 1)
        node.physicsBody?.applyTorque(torqueForce, asImpulse: true)
    }
    
    func addSphere() {
        let geometry = SCNSphere(radius: 1.0)
        let node = SCNNode(geometry: geometry)
        scene.rootNode.addChildNode(node)
        node.position = SCNVector3(0, 1, 0)
    }

}
