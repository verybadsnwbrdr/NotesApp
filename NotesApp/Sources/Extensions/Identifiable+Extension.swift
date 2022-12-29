//
//  Identifiable+Extension.swift
//  NotesApp
//
//  Created by Anton on 29.12.2022.
//

extension Identifiable {
	static var identifier: String {
		String(describing: Self.self)
	}
}
