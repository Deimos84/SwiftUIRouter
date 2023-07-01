//
//  Created by Korchagin Dmitry on 01.07.2023.
//  Copyright © 2023 Sberbank. All rights reserved.
//

import SwiftUI

struct UIViewEmitterView: UIViewRepresentable {
	func updateUIView(_ uiView: UIView, context: Context) {}
	
	func makeUIView(context: UIViewRepresentableContext<UIViewEmitterView>) -> UIView {
		let view = UIViewView()
		return view
	}
}
