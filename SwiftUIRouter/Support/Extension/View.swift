//
//  Created by Korchagin Dmitry on 01.07.2023.
//  Copyright © 2023 Sberbank. All rights reserved.
//

import SwiftUI

extension View {
	func toolbarStyle(title: String) -> some View {
		modifier(ToolbarModifier(title: title))
	}
	
	func buttonStyle() -> some View {
		modifier(ButtonStyleModifier())
	}
	
	func titleStyle() -> some View {
		modifier(TitleStyleModifier())
	}
	
	func button(
		lable: String,
		action: @escaping () -> Void
	) -> some View {
		Button(
			action: action,
			label: {
				Text(lable).buttonStyle()
			}
		)
	}
}

struct ToolbarModifier: ViewModifier {
	let title: String

	func body(content: Content) -> some View {
		content
			.ignoresSafeArea(.all)
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					Text(title)
						.font(Font(CTFont(.alertHeader, size: 25)))
						.foregroundColor(.cyan)
				}
			}
	}
}

struct ButtonStyleModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.font(Font(CTFont(.alertHeader, size: 25)))
			.foregroundColor(.pink)
	}
}

struct TitleStyleModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.font(Font(CTFont(.toolbar, size: 45)))
			.foregroundColor(.cyan)
	}
}
