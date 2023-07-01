//
//  Created by Korchagin Dmitry on 01.07.2023.
//  Copyright © 2023 Sberbank. All rights reserved.
//

import SwiftUI

struct StoryboardEmitterView: UIViewControllerRepresentable {
	typealias UIViewControllerType = UIViewController
	
	func makeUIViewController(context: Context) -> UIViewController {
		let storyboard = UIStoryboard(name: "StoryboardName", bundle: nil)
		return storyboard.instantiateViewController(withIdentifier: "StoryboardID")
	}
	
	func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
	}
}
