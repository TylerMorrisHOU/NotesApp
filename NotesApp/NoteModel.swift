//
//  NoteModel.swift
//  NotesApp
//
//  Created by Tyler Morris on 11/17/24.
//

import Foundation
import FirebaseFirestore

struct NoteModel : Codable, Identifiable {
    @DocumentID var id : String?
    var title : String
    var notesdata : String
}
