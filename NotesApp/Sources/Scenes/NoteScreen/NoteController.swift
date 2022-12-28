//
//  NoteController.swift
//  NotesApp
//
//  Created by Anton on 26.12.2022.
//

import UIKit

class NoteController: UIViewController {
	
	// MARK: - Reference
	
	var selfView: NoteView?
	var note: NoteModel?
	var dataManager: NoteDataManager?
	
	// MARK: - NavigationBarItem
	
	private lazy var addNoteButton: UIBarButtonItem = {
		let button = UIBarButtonItem()
		button.title = Localization.done.string
		button.target = self
		button.action = #selector(hideKeyBoard)
		return button
	}()
	
	// MARK: - LifeCycle
	
	override func loadView() {
//		view = NoteView(controller: self)
		selfView = NoteView(controller: self)
		view = selfView
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		navigationItem.largeTitleDisplayMode = .never
		navigationItem.rightBarButtonItem = addNoteButton
		if let view = view as? NoteView {
			view.setupView(with: note)
		}
	}
}

// MARK: - Actions

private extension NoteController {
	@objc func hideKeyBoard() {
		selfView?.hideKeyBoard()
	}
	
	func saveChanges() {
		guard let updatedNote = selfView?.noteWithChanges() else { return }
		note?.title = updatedNote.title
		note?.note = updatedNote.note
		dataManager?.saveContext()
	}
}

// MARK: - TextViewDelegate

extension NoteController: UITextViewDelegate, UITextFieldDelegate {
	func textViewDidEndEditing(_ textView: UITextView) {
		saveChanges()
	}
	
	func textFieldDidEndEditing(_ textField: UITextField) {
		saveChanges()
	}
}
