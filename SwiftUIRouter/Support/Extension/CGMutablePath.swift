//
//  Created by Korchagin Dmitry on 01.07.2023.
//  Copyright © 2023 Sberbank. All rights reserved.
//

import CoreGraphics

extension CGMutablePath {
	func create(from points: inout [CGPoint]) -> CGMutablePath {
		let path = CGMutablePath()
		
		guard !points.isEmpty else { return path }
		
		path.move(to: points[0])
		path.addLines(between: points)
		path.closeSubpath()
		return path
	}
}
