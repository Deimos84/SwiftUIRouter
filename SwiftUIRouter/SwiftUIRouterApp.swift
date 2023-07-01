//
//  Created by Korchagin Dmitry on 23.06.2023.
//  Copyright © 2023 Sberbank. All rights reserved.
//

import SwiftUI
import SpriteKit

@main

struct SwiftUIRouterApp: App {
	@ObservedObject var router = Router.shared
	
	var body: some Scene {
		WindowGroup {
			NavigationStack(path: $router.path) {
				MenuView(coordinator: MenuCoordinator(router: router))
					.navigationDestination(for: Route.self) { route in
						switch route {
						case let .swiftUI(page):
							SwiftUIView(coordinator: SwiftUICoordinator(router: router, page: page))
								.toolbarStyle(title: "SwiftUI")
						case .storyboard:
							StoryboardEmitterView()
								.toolbarStyle(title: "Storyboard")
						case .spriteKit:
							SpriteKitEmitterView()
								.toolbarStyle(title: "SpriteKit")
						case .uiKit:
							UIViewEmitterView()
								.toolbarStyle(title: "UIKit")
						}
					}
			}
		}
	}
}
