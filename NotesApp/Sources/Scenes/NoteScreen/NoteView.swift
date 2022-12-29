//
//  NoteView.swift
//  NotesApp
//
//  Created by Anton on 26.12.2022.
//

import UIKit
import SnapKit

final class NoteView: UIView {
	
	// MARK: - References
	
	private weak var controller: NoteController?
	
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
		textField.layer.cornerRadius = Constants.topPaddingAndCornerRadius.rawValue
		textField.backgroundColor = .white
		textField.placeholder = Localization.placeHolder.string
		textField.leftView = UIView(frame: Constants.textFieldViewWidth.textFieldViewFrame)
		textField.leftViewMode = .always
		return textField
	}()
	
	private lazy var textView: UITextView = {
		let textView = UITextView()
		textView.textAlignment = .left
		textView.font = Fonts.systemMedium.regular
		textView.delegate = controller
		textView.layer.cornerRadius = Constants.topPaddingAndCornerRadius.rawValue
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
	
	private func setupHierarchy() {
		addSubview(textField)
		addSubview(textView)
	}
	
	private func setupLayout() {
		textField.snp.makeConstraints { make in
			make.left.top.equalTo(self.safeAreaLayoutGuide).offset(Constants.horizontalPadding.rawValue)
			make.right.equalTo(self.safeAreaLayoutGuide).offset(Constants.horizontalPadding.minus)
			make.height.equalTo(Constants.textFieldHeight.rawValue)
		}
		
		textView.snp.makeConstraints { make in
			make.top.equalTo(textField.snp.bottom).offset(Constants.topPaddingAndCornerRadius.rawValue)
			make.left.equalTo(self.safeAreaLayoutGuide).offset(Constants.horizontalPadding.rawValue)
			make.right.bottom.equalTo(self.safeAreaLayoutGuide).offset(Constants.horizontalPadding.minus)
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
