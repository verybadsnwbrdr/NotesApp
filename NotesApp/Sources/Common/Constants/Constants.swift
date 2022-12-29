//
//  Constants.swift
//  NotesApp
//
//  Created by Anton on 29.12.2022.
//

import Foundation

enum Constants: CGFloat {
	case horizontalPadding = 22
	case textFieldHeight = 50
	case tableHeight = 60
	case topPaddingAndCornerRadius = 10
	case textFieldViewWidth = 5

	var minus: CGFloat { -rawValue }
	var textFieldViewFrame: CGRect { .init(x: 0, y: 0, width: rawValue, height: 0) }
}
