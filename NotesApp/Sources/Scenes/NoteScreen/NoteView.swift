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
	
	weak var controller: UIViewController?
	
	// MARK: - Elements
	
	private lazy var textField: UITextField = {
		let textField = UITextField()
		textField.textAlignment = .left
		textField.contentVerticalAlignment = .top
		return textField
	}()
	
	private lazy var stack: UIStackView = {
		let stack = UIStackView()
		
		return stack
	}()
	
	// MARK: - Initialization
	
	init(controller: UIViewController) {
		super.init(frame: .zero)
		self.controller = controller
		backgroundColor = .white
		setupHierarchy()
		setupLayout()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - Setup
	
	func setupHierarchy() {
		
		addSubview(textField)
	}
	
	func setupLayout() {
		textField.snp.makeConstraints { make in
//			make.verticalEdges.equalTo(self.safeAreaLayoutGuide).offset(-30)
//
//			make.bottom.equalTo(snp.bottom).offset(-10)
//			make.edges.equalTo(self.safeAreaLayoutGuide)
			make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(10)
			make.bottom.equalTo(snp.bottom).offset(-20)
			make.left.equalTo(snp.left).offset(20)
			make.right.equalTo(snp.right).offset(-20)
		}
	}
}
