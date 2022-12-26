//
//  NoteController.swift
//  NotesApp
//
//  Created by Anton on 26.12.2022.
//

import UIKit

class NoteController: UIViewController {
	
	// MARK: - Reference
	
//	var model: MainModel
	
	// MARK: - LifeCycle
	
//	init(model: MainModel) {
//		super.init(
//		self.model = model
//	}
	
//	required init?(coder: NSCoder) {
//		fatalError("init(coder:) has not been implemented")
//	}
	
	override func loadView() {
		view = NoteView(controller: self)
	}

	override func viewDidLoad() {
		super.viewDidLoad()
//		title = Localization.title.rawValue
//		navigationController?.navigationBar.prefersLargeTitles = false
	}
}
