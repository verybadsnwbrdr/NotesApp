//
//  NoteView.swift
//  NotesApp
//
//  Created by Anton on 26.12.2022.
//

import UIKit
import SnapKit

class NoteView: SuperView {
	
	// MARK: - Elements
	
	private lazy var textField: UITextField = {
		let textField = UITextField()
		return textField
	}()
	
	// MARK: - Setup
	
	func setupHierarchy() {
		addSubview(textField)
	}
	
	func setupLayout() {
		textField.snp.makeConstraints { make in
			make.edges.equalTo(self.safeAreaLayoutGuide)
		}
	}
}
