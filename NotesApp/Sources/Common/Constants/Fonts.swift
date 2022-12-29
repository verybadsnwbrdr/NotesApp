//
//  Fonts.swift
//  NotesApp
//
//  Created by Anton on 26.12.2022.
//

import UIKit

enum Fonts: CGFloat {
	case systemLarge = 24
	case systemMedium = 18
	case systemSmall = 14
	
	var bold: UIFont { .systemFont(ofSize: rawValue, weight: .bold) }
	var regular: UIFont { .systemFont(ofSize: rawValue, weight: .regular) }
	var medium: UIFont { .systemFont(ofSize: rawValue, weight: .medium) }
}


