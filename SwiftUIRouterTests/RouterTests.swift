//
//  Created by Korchagin Dmitry on 01.07.2023.
//  Copyright © 2023 Sberbank. All rights reserved.
//

import XCTest
@testable import SwiftUIRouter

final class RouterTests: XCTestCase {
	private let sut = Router.shared
	
	func test_PathIsEmpty_SkipAction() {
		sut.back()
		
		XCTAssert(sut.path.isEmpty)
	}
	
	func test_Back_PathNotEmpty_PathCountExpected() {
		showFiveScreens()
		
		sut.back()
		
		XCTAssert(sut.path.count == 4)
	}
	
	func test_BackToRoot_PathIsEmpty_NoErrors() {
		sut.backToRoot()
		
		XCTAssert(sut.path.isEmpty)
	}
	
	func test_BackToRoot_PathNotEmpty_PathIsEmpty() {
		showFiveScreens()
		
		sut.backToRoot()
		
		XCTAssert(sut.path.isEmpty)
	}
	
	func test_ShowFiveScreens_PathCountIsFive() {
		showFiveScreens()
		
		XCTAssert(sut.path.count == 5)
	}
	
	private func showFiveScreens() {
		for i in 1...5 {
			sut.showSwiftUIView(page: i)
		}
	}
}
