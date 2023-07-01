//
//  Created by Korchagin Dmitry on 01.07.2023.
//  Copyright © 2023 Sberbank. All rights reserved.
//

import SwiftUI
import Combine

struct SwiftUIView: View {
	@ObservedObject var coordinator: SwiftUICoordinator
	
	var body: some View {
		HStack() {
			VStack(alignment: .leading) {
				Text("Page \(coordinator.page)")
					.titleStyle()
					.padding(.top, 100)
				
				button(lable: "Next page", action: coordinator.showNextPage)
					.padding(.top, 20)
				
				button(lable: "Previuos page", action: coordinator.router.back)
					.padding(.top, 20)
				
				button(lable: "Back to root", action: coordinator.router.backToRoot)
					.padding(.top, 20)
				
				Spacer()
			}
			.padding(.leading, 40)
			
			Spacer()
		}
		.toolbar(.hidden)
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(.black)
		.ignoresSafeArea(.all)
	}
}
