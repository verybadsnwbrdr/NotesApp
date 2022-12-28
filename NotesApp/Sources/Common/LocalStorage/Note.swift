//
//  NoteModel.swift
//  NotesApp
//
//  Created by Anton on 28.12.2022.
//

import Foundation

class Note: Codable {
	var id = UUID()
	var title: String
	var note: String
	
	init(title: String, note: String) {
		self.title = title
		self.note = note
	}
	
	static let mock = Note(title: "Hello", note: "sfsdfsdf \n sdfdsf")
}

