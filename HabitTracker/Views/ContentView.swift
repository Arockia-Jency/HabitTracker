//
//  ContentView.swift
//  The Vault
//
//  Created by Jency on 05/02/26.
//

import SwiftUI
import SwiftData


struct ContentView: View {
    
    @State private var viewModel = VaultViewModel()
    @State private var isShowingAddNote: Bool = false
    @Query private var notes: [Note]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack{
            
            VStack(spacing:30){
                
                if viewModel.isLocked {
                    
                    Image(systemName: "lock.shield.fill")
                        .font(.system(size: 100))
                        .foregroundColor(.red)
                        .transition(.scale)
                    
                    Text("Your Vault is Locked")
                    
                    Button("Unlock Now"){
                        withAnimation(.spring(duration: 0.5)) {
                            viewModel.toggleLock()
                        }
                    }
                    .buttonStyle(.borderedProminent)
                        
                } else {
                    List {
                        ForEach(notes) { note in
                            VStack (alignment: .leading){
                                Text(note.content)
                                    .font(.headline)
                                Text(note.dateCreated.formatted(date: .abbreviated, time: .shortened))
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                        }
                        .onDelete { indexSet in
                            for index in indexSet {
                                let noteToDelete = notes[index]
                                modelContext.delete(noteToDelete)
                            }
                            // Optional but can help ensure immediate persistence
                            try? modelContext.save()
                        }
                    }
                    .listStyle(.insetGrouped)
                    // 2. This is the magic line to remove the gray table background
                    .scrollContentBackground(.hidden)
                    // 3. Set your custom background for the whole view
                    .background(
                        LinearGradient(colors: [.blue.opacity(0.1), .purple.opacity(0.1)],
                                       startPoint: .topLeading,
                                       endPoint: .bottomTrailing)
                    )
                }
            }
            .navigationTitle("The Vault")
            .padding()
            .toolbar {
                // Add EditButton to enable delete controls
                ToolbarItem(placement: .topBarLeading) {
                    if !viewModel.isLocked {
                        EditButton()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    if !viewModel.isLocked {
                        Button(action: { isShowingAddNote = true }) {
                            Image(systemName: "plus.circle.fill")
                        }
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button("Lock"){
                        withAnimation{
                            viewModel.toggleLock()
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $isShowingAddNote){
            AddNoteView(viewModel: viewModel)
        }
    }
}

#Preview {
    ContentView()
}
