//
//  NoteModel.swift
//  NotesApp
//
//  Created by Anton on 28.12.2022.
//

import Foundation

class NoteModelUD: Codable {
	var notes: [Note]
	
	init() {
		self.notes = Self.load()
	}
	
	// MARK: - Methods
	
	func save() {
		guard let data = try? JSONEncoder().encode(self) else { return }
//		UserDefaults.standard.set(data, forKey: "test")
		UserDefaults.standard.setValue(data, forKey: "test")
	}
	
	static func load() -> [Note] {
		guard let data = UserDefaults.standard.value(forKey: "test") as? Data,
			  let notes = try? JSONDecoder().decode(self, from: data).notes else { return [] }
		return notes
	}
	
	func createNewNote() -> Int {
		notes.append(Note(title: String(), note: String()))
		save()
		return notes.count - 1
	}
	
	func delete(_ row: Int) {
		notes.remove(at: row)
		save()
	}
}
