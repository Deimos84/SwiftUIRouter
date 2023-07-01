//
//  Created by Korchagin Dmitry on 01.07.2023.
//  Copyright © 2023 Sberbank. All rights reserved.
//

import Combine
import SwiftUI

final class SwiftUICoordinator: ObservableObject {
	let router: Router
	let page: Int
	
	init(
		router: Router,
		page: Int
	) {
		self.page = page
		self.router = router
	}
	
	func showNextPage() {
		router.showSwiftUIView(page: page + 1)
	}
}
