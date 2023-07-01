//
//  Created by Korchagin Dmitry on 01.07.2023.
//  Copyright © 2023 Sberbank. All rights reserved.
//

import UIKit

extension UIColor {
	static var random: UIColor {
		let intRandom: Int = .random(in: 1...5)
		
		switch intRandom {
		case 1:
			return .red
		case 2:
			return .green
		case 3:
			return .blue
		case 4:
			return .orange
		case 5:
			return .magenta
		default:
			return .purple
		}
	}
}
