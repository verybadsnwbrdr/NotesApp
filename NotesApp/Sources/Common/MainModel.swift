//
//  MainModel.swift
//  NotesApp
//
//  Created by Anton on 26.12.2022.
//

import Foundation

struct MainModel {
	var title: String
	var note: String
}

extension MainModel {
	static var mockModel: [MainModel] = [
		MainModel(title: "Yana", note: "BlaBlaBlaaaaaa"),
		MainModel(title: "Anton", note: "Tyryryryryryryry"),
		MainModel(title: "Test", note: "TestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTest")
	]
}


