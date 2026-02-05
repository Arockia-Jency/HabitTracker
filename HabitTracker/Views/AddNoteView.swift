//
//  AddNoteView.swift
//  The Vault
//
//  Created by Jency on 05/02/26.
//

import SwiftUI
import SwiftData

struct AddNoteView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var noteText = ""
    @State private var selectedCategory: NoteCategory = .personal
    var viewModel:VaultViewModel
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack{
            Form{
                Section("What's on your mind?"){
                    TextEditor(text: $noteText)
                        .frame(height: 200)
                }
                
                Section("Category") {
                    Picker("Category", selection: $selectedCategory) {
                        ForEach(NoteCategory.allCases) { category in
                            Text(category.rawValue).tag(category)
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
            .navigationTitle("New Note")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let newNote = Note(content: noteText, category: selectedCategory)
                        modelContext.insert(newNote)
                        dismiss()
                    }
                    .disabled(noteText.isEmpty)
                }
                
                ToolbarItem(placement: .cancellationAction){
                    Button("Cancel"){
                        dismiss()
                    }
                }
            }
        }
    }
}

