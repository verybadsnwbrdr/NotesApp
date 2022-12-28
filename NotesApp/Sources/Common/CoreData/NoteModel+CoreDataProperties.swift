//
//  NoteModel+CoreDataProperties.swift
//  NotesApp
//
//  Created by Anton on 28.12.2022.
//
//

import Foundation
import CoreData


extension NoteModel {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<NoteModel> {
        return NSFetchRequest<NoteModel>(entityName: "NoteModel")
    }

    @NSManaged public var title: String?
    @NSManaged public var note: String?
}

extension NoteModel: Identifiable {

}
