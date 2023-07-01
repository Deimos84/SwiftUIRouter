//
//  Created by Korchagin Dmitry on 01.07.2023.
//  Copyright © 2023 Sberbank. All rights reserved.
//

import Combine
import SwiftUI

final class MenuCoordinator: ObservableObject {
	let router: Router
	
	init(router: Router) {
		self.router = router
	}
}
