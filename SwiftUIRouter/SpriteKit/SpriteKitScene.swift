//
//  Created by Korchagin Dmitry on 23.06.2023.
//  Copyright © 2023 Sberbank. All rights reserved.
//

import SpriteKit
import GameplayKit

class SpriteKitScene: SKScene {
	
	override init(size: CGSize) {
		super.init(size: size)
		
		physicsWorld.gravity = .init(dx: 0.0, dy: -5.0)
	}
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func didMove(to view: SKView) {
		
		let floorNode = createFloor()
		addChild(floorNode)
		floorNode.position.y = -300
		
		createFirstCircles()
	}
	
	private func createFirstCircles() {
		let halfSizeWidth: Int = Int(size.width / 4)
		for i in 0...500 {
			let radius = 6
			spawnCircle(
				radius: CGFloat(radius),
				position: CGPoint(x: .random(in: -halfSizeWidth...halfSizeWidth), y: Int(size.height / 4) + radius * i * 4),
				massCircle: 1,
				color: .red,
				isFil: false
			)
		}
	}
	
	private func createFloor() -> SKShapeNode {
		let width = Int(size.width / 2) - 50
		let wallWidth = 10
		let height = 200
		var points = [
			CGPoint(x: -width, y: height),
			CGPoint(x: -width, y: 0),
			CGPoint(x: width, y: 0),
			CGPoint(x: width, y: height),
			CGPoint(x: width + wallWidth, y: height),
			CGPoint(x: width + wallWidth, y: -wallWidth),
			CGPoint(x: -width - wallWidth, y: -wallWidth),
			CGPoint(x: -width - wallWidth, y: height),
			CGPoint(x: -width, y: height)
		]
		
		let nodeView = SKShapeNode(points: &points, count: points.count)
		nodeView.lineWidth = 2
		nodeView.strokeColor = .yellow
		
		let path = CGMutablePath().create(from: &points)
		nodeView.physicsBody = SKPhysicsBody(edgeLoopFrom: path)
		nodeView.physicsBody?.isDynamic = false
		nodeView.physicsBody?.friction = 0.8
		
		return nodeView
	}
	
	private func spawnCircle(
		radius: CGFloat,
		position: CGPoint,
		massCircle: CGFloat,
		color: UIColor,
		isFil: Bool
	) {
		let nodeView = SKShapeNode(circleOfRadius: radius)
		nodeView.lineWidth = 2
		nodeView.position = position
		if isFil {
			let magic = SKEmitterNode(fileNamed: "FireEffect")
			nodeView.fillColor = color
			nodeView.addChild(magic!)
		} else {
			nodeView.strokeColor = color
		}
		
		nodeView.physicsBody = .init(circleOfRadius: radius)
		nodeView.physicsBody?.isDynamic = true
		nodeView.physicsBody?.mass = massCircle
		nodeView.physicsBody?.friction = 0.8
		
		addChild(nodeView)
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		if touches.count == 2 {
			createFirstCircles()
		}
		
		for touch in touches {
			let location = touch.location(in: self)
			spawnCircle(
				radius: 40,
				position: location,
				massCircle: 1000,
				color: .random,
				isFil: true
			)
			
		}
	}
	
	override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
		for touch in touches {
			print("touch.location = ", touch.location(in: self))
		}
	}
	
	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
		for touch in touches {
			print("touch.location = ", touch.location(in: self))
		}
	}
	
	override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
		for touch in touches {
			print("touch.location = ", touch.location(in: self))
		}
	}
	
	override func update(_ currentTime: TimeInterval) {
		children.forEach { child in
			if child.position.y < -size.height {
				child.removeFromParent()
			}
		}
	}
}
