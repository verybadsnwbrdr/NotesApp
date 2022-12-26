//
//  MainViewController.swift
//  NotesApp
//
//  Created by Anton on 26.12.2022.
//

import UIKit

class MainController: UIViewController {
	
	// MARK: - Reference
	
	var models: [MainModel] = MainModel.mockModel
	
	// MARK: - NavigationBarItem
	
	private lazy var addNoteButton: UIBarButtonItem = {
		let button = UIBarButtonItem()
		button.image = Images.addNoteButton.image
		button.target = self
		button.action = #selector(addNote)
		return button
	}()
	
	// MARK: - LifeCycle
	
	override func loadView() {
		view = MainView(controller: self)
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		title = Localization.title.rawValue
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.rightBarButtonItem = addNoteButton
	}
}

// MARK: - Extensions

extension MainController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		models.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let model = models[indexPath.row]
		guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableCell.identifier, for: indexPath) as? MainTableCell else { return UITableViewCell() }
		cell.setupCellContent(with: model)
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		tapFor(indexPath)
	}
}

// MARK: - Actions

private extension MainController {
	@objc private func addNote() {
		
	}
	
	func tapFor(_ row: IndexPath) {
//		guard let viewController = NoteController() else { return }
		navigationController?.pushViewController(NoteController(), animated: true)
	}
}
