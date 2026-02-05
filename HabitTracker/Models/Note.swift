//
//  Note.swift
//  The Vault
//
//  Created by Jency on 05/02/26.
//

import Foundation
import SwiftData

enum NoteCategory: String, Codable, CaseIterable, Identifiable {
    case personal = "Personal"
    case work = "Work"
    case ideas = "Ideas"

    var id: String { rawValue }
}

@Model // 1. Tells SwiftData to save this
class Note {
    var id: UUID
    var content: String
    var dateCreated: Date
    var category: NoteCategory

    init(content: String, category: NoteCategory = .personal) {
        self.id = UUID()
        self.content = content
        self.dateCreated = Date()
        self.category = category
    }
}

