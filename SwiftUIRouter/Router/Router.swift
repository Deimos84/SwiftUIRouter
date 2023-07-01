//
//  Created by Korchagin Dmitry on 01.07.2023.
//  Copyright © 2023 Sberbank. All rights reserved.
//

import Combine
import SwiftUI

final class Router: ObservableObject {
	static let shared = Router()
	
	@Published var path = [Route]()
	
	func showSwiftUIView(page: Int) {
		path.append(.swiftUI(page))
	}
	
	func showSpriteKitScene() {
		path.append(.spriteKit)
	}
	
	func showUIKitView() {
		path.append(.uiKit)
	}
	
	func showStoryboard() {
		path.append(.storyboard)
	}
	
	func backToRoot() {
		path.removeAll()
	}
	
	func back() {
		guard !path.isEmpty else {
			return
		}
		
		path.removeLast()
	}
}

enum Route: Hashable {
	case uiKit
	case spriteKit
	case storyboard
	case swiftUI(Int)
}
