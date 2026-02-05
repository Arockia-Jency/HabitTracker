//
//  ValueListView.swift
//  HabitTracker
//
//  Created by Jency on 05/02/26.
//

import SwiftUI
import SwiftData

struct VaultListView: View {
    @Query private var notes: [Note]
    @Environment(\.modelContext) var modelContext

    // The init re-runs every time searchString changes
    init(searchString: String) {
        let predicate = #Predicate<Note> { note in
            if searchString.isEmpty {
                return true
            } else {
                return note.content.localizedStandardContains(searchString)
            }
        }
        
        _notes = Query(filter: predicate, sort: [SortDescriptor(\Note.dateCreated, order: .reverse)])
    }

    var body: some View {
        List {
            ForEach(notes) { note in
                VStack(alignment: .leading) {
                    Text(note.content)
                        .font(.headline)
                    Text(note.dateCreated.formatted(date: .abbreviated, time: .shortened))
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
            .onDelete { indexSet in
                for index in indexSet {
                    modelContext.delete(notes[index])
                }
            }
        }
        .listStyle(.insetGrouped)
        .scrollContentBackground(.hidden) // Keeps your stylish background visible
    }
}
