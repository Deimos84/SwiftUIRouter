//
//  Created by Korchagin Dmitry on 23.06.2023.
//  Copyright © 2023 Sberbank. All rights reserved.
//

import UIKit

final class UIViewView: UIView {
	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = .red
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
