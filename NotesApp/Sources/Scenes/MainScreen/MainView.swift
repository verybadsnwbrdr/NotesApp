//
//  MainView.swift
//  NotesApp
//
//  Created by Anton on 26.12.2022.
//

import UIKit
import SnapKit

class MainView: UIView {
	
	// MARK: - References
	
	weak var controller: MainController?
	
	// MARK: - Elements
	
	private lazy var tableView: UITableView = {
		let tableView = UITableView(frame: .zero, style: .insetGrouped)
		tableView.register(MainTableCell.self, forCellReuseIdentifier: MainTableCell.identifier)
		tableView.dataSource = controller
		tableView.delegate = controller
		return tableView
	}()
	
	// MARK: - Initialization
	
	init(controller: MainController) {
		super.init(frame: .zero)
		self.controller = controller
		backgroundColor = .blue
		setupHierarchy()
		setupLayout()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - Setup
	
	private func setupHierarchy() {
		addSubview(tableView)
	}
	
	private func setupLayout() {
		tableView.snp.makeConstraints { make in
			make.edges.equalTo(self)
		}
	}
}
