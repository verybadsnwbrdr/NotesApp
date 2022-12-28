//
//  MainViewController.swift
//  NotesApp
//
//  Created by Anton on 26.12.2022.
//

import UIKit

class MainController: UIViewController {
	
	// MARK: - Reference

	var models: [NoteModel]?
	var dataManager = NoteDataManager()
	var selfView: MainView?
	
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
//		view = MainView(controller: self)
		selfView = MainView(controller: self)
		view = selfView
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		title = Localization.title.string
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.rightBarButtonItem = addNoteButton
		models = dataManager.getModels()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		selfView?.reloadTable()
	}
}

// MARK: - Extensions

extension MainController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		models?.count ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let model = models?[indexPath.row] ?? NoteModel()
		guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableCell.identifier, for: indexPath) as? MainTableCell else { return UITableViewCell() }
		cell.setupCellContent(with: model)
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		tapFor(indexPath.row)
	}
	
	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		guard editingStyle == .delete, let model = models?[indexPath.row] else { return }
		dataManager.deleteFromContext(note: model)
		updateModels()
		selfView?.reloadTable()
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		75
	}
}

// MARK: - Actions

private extension MainController {
	@objc private func addNote() {
		dataManager.addModel()
		updateModels()
		tapFor((models?.count ?? 0) - 1)
	}
	
	func tapFor(_ row: Int) {
		let viewController = NoteController()
		viewController.note = models?[row]
		viewController.dataManager = dataManager
		navigationController?.pushViewController(viewController, animated: true)
	}
	
	func updateModels() {
		models = dataManager.getModels()
	}
}
