//
//  SuperView.swift
//  NotesApp
//
//  Created by Anton on 26.12.2022.
//

import UIKit

class SuperView: UIView {

	// MARK: - References
	
	weak var controller: UIViewController?
	
	// MARK: - Initialization
	
	init(controller: UIViewController) {
		super.init(frame: .zero)
		self.controller = controller
		setupHierarchy()
		setupLayout()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - Setup
	
	private func setupHierarchy() {
	}
	
	private func setupLayout() {
	}
}
