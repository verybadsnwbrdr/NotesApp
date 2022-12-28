//
//  NoteView.swift
//  NotesApp
//
//  Created by Anton on 26.12.2022.
//

import UIKit
import SnapKit

class NoteView: UIView {
	
	// MARK: - References
	
	weak var controller: NoteController?
	
	// MARK: - SetupView
	
	public func setupView(with model: NoteModel?) {
		textField.text = model?.title
		textView.text = model?.note
	}
	
	// MARK: - Elements
	
	private lazy var textField: UITextField = {
		let textField = UITextField()
		textField.textAlignment = .left
		textField.font = Fonts.systemLarge.bold
		textField.delegate = controller
		textField.layer.cornerRadius = 10
		textField.backgroundColor = .white
		return textField
	}()
	
	private lazy var textView: UITextView = {
		let textView = UITextView()
		textView.textAlignment = .left
		textView.font = Fonts.systemMedium.regular
		textView.delegate = controller
		textView.layer.cornerRadius = 10
		return textView
	}()
	
	// MARK: - Initialization
	
	init(controller: NoteController) {
		super.init(frame: .zero)
		self.controller = controller
		backgroundColor = .systemGray6
		setupHierarchy()
		setupLayout()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - Setup
	
	func setupHierarchy() {
		addSubview(textField)
		addSubview(textView)
	}
	
	func setupLayout() {
		textField.snp.makeConstraints { make in
			make.left.top.equalTo(self.safeAreaLayoutGuide).offset(20)
			make.right.equalTo(self.safeAreaLayoutGuide).offset(-20)
			make.height.equalTo(50)
		}
		
		textView.snp.makeConstraints { make in
			make.top.equalTo(textField.snp.bottom).offset(10)
			make.left.equalTo(self.safeAreaLayoutGuide).offset(20)
			make.right.bottom.equalTo(self.safeAreaLayoutGuide).offset(-20)
		}
	}
}

// MARK: - Methods

extension NoteView {
	public func noteWithChanges() -> (title: String, note: String)? {
		guard let title = textField.text, let note = textView.text else { return nil }
		return (title, note)
	}
	
	public func hideKeyBoard() {
		textView.endEditing(true)
		textField.endEditing(true)
	}
}
