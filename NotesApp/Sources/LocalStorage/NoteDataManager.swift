//
//  NoteDataManager.swift
//  NotesApp
//
//  Created by Anton on 28.12.2022.
//

import Foundation
import CoreData

final class NoteDataManager {
	
	// MARK: - Singleton
	
	static let shared = NoteDataManager.init()
	private init() { }
	
	// MARK: - Properties
	
	private lazy var persistentContainer: NSPersistentContainer = {
		let container = NSPersistentContainer(name: "NotesApp")
		container.loadPersistentStores { storeDescription, error in
			if let error = error as NSError? {
				fatalError("Unresolved error \(error), \(error.userInfo)")
			}
		}
		return container
	}()
	
	private let fetchRequest = NoteModel.fetchRequest()
	private lazy var context: NSManagedObjectContext = { persistentContainer.viewContext }()
	
}

// MARK: - Public Methods

extension NoteDataManager {
	
	public func addModel() {
		let managedObject = NoteModel(context: context)
		managedObject.title = String()
		managedObject.note = String()
		saveContext()
	}
	
	public func saveContext() {
		guard context.hasChanges else { return }
		do {
			try context.save()
		} catch {
			let nserror = error as NSError
			fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
		}
	}

	public func deleteFromContext(note: NoteModel) {
		context.delete(note)
		saveContext()
	}
	
	public func getModels() -> [NoteModel] {
		guard let models = try? context.fetch(fetchRequest) else { return [] }
		return models
	}
	
	public func updateModel(for note: NoteModel) {
		let objectToUpdate = context.object(with: note.objectID) as? NoteModel
		objectToUpdate?.title = note.title
		objectToUpdate?.note = note.note
		saveContext()
	}
}
