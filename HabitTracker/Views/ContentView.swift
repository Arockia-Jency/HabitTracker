//
//  ContentView.swift
//  The Vault
//
//  Created by Jency on 05/02/26.
//

import SwiftUI
import SwiftData


import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var viewModel = VaultViewModel()
    @State private var isShowingAddNote = false
    @State private var searchText = ""

    var body: some View {
        NavigationStack {
            ZStack {
                // 1. The Full Screen Background Layer
                LinearGradient(colors: [.blue.opacity(0.15), .purple.opacity(0.15)],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                    .ignoresSafeArea() //

                // 2. The Content Layer
                VStack {
                    if viewModel.isLocked {
                        VStack(spacing: 30) {
                            Image(systemName: "lock.shield.fill")
                                .font(.system(size: 100))
                                .foregroundStyle(.red.gradient) //
                            
                            Text("Your Vault is Locked")
                                .font(.headline)
                            
                            Button("Unlock Now") {
                                // If you added the authenticate() function, use it here!
                                withAnimation(.spring()) {
                                    viewModel.authenticate()
                                }
                            }
                            .buttonStyle(.borderedProminent)
                            .controlSize(.large)
                        }
                        .transition(.scale)
                    } else {
                        VaultListView(searchString: searchText)
                    }
                }
            }
            .navigationTitle("The Vault")
            // Searchable needs to stay on the outer container
            .searchable(text: $searchText, prompt: "Search notes")
            .toolbar {
                if !viewModel.isLocked {
                    ToolbarItemGroup(placement: .topBarLeading) {
                        Button("Lock") {
                            withAnimation { viewModel.toggleLock() }
                        }
                        EditButton()
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: { isShowingAddNote = true }) {
                            Image(systemName: "plus.circle.fill")
                                .font(.title3)
                        }
                    }
                }
            }
            .sheet(isPresented: $isShowingAddNote) {
                AddNoteView(viewModel: viewModel)
            }
        }
    }
}
