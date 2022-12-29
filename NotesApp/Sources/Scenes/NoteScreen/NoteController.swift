//
//  NoteController.swift
//  NotesApp
//
//  Created by Anton on 26.12.2022.
//

import UIKit

final class NoteController: UIViewController {
	
	// MARK: - Reference
	
	private var subView: NoteView?
	var note: NoteModel?
	private let dataManager = NoteDataManager.shared
	private var isKeyBoardHiden = true
	
	// MARK: - NavigationBarItem
	
	private lazy var hideKeyboardButton: UIBarButtonItem = {
		let button = UIBarButtonItem()
		button.image = Images.keyBoardDismiss.image
		button.target = self
		button.action = #selector(hideKeyBoard)
		return button
	}()
	
	// MARK: - LifeCycle
	
	override func loadView() {
		subView = NoteView(controller: self)
		view = subView
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		navigationItem.largeTitleDisplayMode = .never
		subView?.setupView(with: note)
	}
}

// MARK: - Actions

private extension NoteController {
	
	@objc func hideKeyBoard() {
		subView?.hideKeyBoard()
	}
	
	func saveChanges() {
		guard let updatedNote = subView?.noteWithChanges() else { return }
		note?.title = updatedNote.title
		note?.note = updatedNote.note
		dataManager.saveContext()
	}
}

// MARK: - TextViewDelegate

extension NoteController: UITextViewDelegate, UITextFieldDelegate {
	
	func textFieldDidBeginEditing(_ textField: UITextField) {
		navigationItem.setRightBarButton(hideKeyboardButton, animated: true)
	}
	
	func textViewDidEndEditing(_ textView: UITextView) {
		navigationItem.setRightBarButton(nil, animated: true)
		saveChanges()
	}

	func textViewDidBeginEditing(_ textView: UITextView) {
		navigationItem.setRightBarButton(hideKeyboardButton, animated: true)
	}
	
	func textFieldDidEndEditing(_ textField: UITextField) {
		navigationItem.setRightBarButton(nil, animated: true)
		saveChanges()
	}
}
