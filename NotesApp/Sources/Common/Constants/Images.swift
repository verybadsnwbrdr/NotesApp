//
//  Images.swift
//  NotesApp
//
//  Created by Anton on 26.12.2022.
//

import UIKit

enum Images: String {
	case addNoteButton = "plus"
	case keyBoardDismiss = "keyboard.chevron.compact.down"
	
	var image: UIImage? { .init(systemName: rawValue) }
}
