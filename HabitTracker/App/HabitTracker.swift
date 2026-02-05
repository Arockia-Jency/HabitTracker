//
//  The_VaultApp.swift
//  The Vault
//
//  Created by Jency on 05/02/26.
//

import SwiftUI
import SwiftData

@main
struct HabitTracker: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Note.self)
    }
}
