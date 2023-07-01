//
//  Created by Korchagin Dmitry on 01.07.2023.
//  Copyright © 2023 Sberbank. All rights reserved.
//

import SwiftUI
import SpriteKit

struct SpriteKitEmitterView: UIViewRepresentable {
	func updateUIView(_ uiView: SKView, context: Context) {}
	
	func makeUIView(context: UIViewRepresentableContext<SpriteKitEmitterView>) -> SKView {
		let view = SKView()
		let size = CGSize(
			width: UIScreen.main.bounds.width,
			height: UIScreen.main.bounds.height
		)
		
		// Load the SKScene from 'GameScene.sks'
		let scene = SpriteKitScene(size: size)
		scene.scaleMode = .aspectFill
		scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
		
		let cameraNode = SKCameraNode()
		scene.camera = cameraNode
		scene.addChild(cameraNode)
		
		// Present the scene
		view.presentScene(scene)
		
		// Settings
		view.showsFPS = true
		view.showsFields = false
		view.showsPhysics = false
		view.showsNodeCount = true
		view.ignoresSiblingOrder = true
		view.isMultipleTouchEnabled = true
		
		return view
	}
}
