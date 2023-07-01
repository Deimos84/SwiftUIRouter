//
//  Created by Korchagin Dmitry on 01.07.2023.
//  Copyright © 2023 Sberbank. All rights reserved.
//

import SwiftUI
import Combine

struct MenuView: View {
	@ObservedObject var coordinator: MenuCoordinator

	var body: some View {
		HStack() {
			VStack(alignment: .leading) {
				Text("SwiftUI Router").titleStyle()
					.padding(.top, 100)
				
				button(lable: "SwiftUI view") { [coordinator] in
					coordinator.router.showSwiftUIView(page: 1)
				}
					.padding(.top, 20)
				
				button(lable: "Storyboard view", action: coordinator.router.showStoryboard)
					.padding(.top, 20)
				
				button(lable: "SpriteKit scene", action: coordinator.router.showSpriteKitScene)
					.padding(.top, 20)
				
				button(lable: "UIKit view", action: coordinator.router.showUIKitView)
					.padding(.top, 20)
				
				Spacer()
				
			}
			.padding(.leading, 40)
			
			Spacer()
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(.black)
		.ignoresSafeArea(.all)
	}
}

struct RatingsView_Previews: PreviewProvider {
	static var previews: some View {
		MenuView(coordinator: MenuCoordinator(router: Router.shared))
	}
}

