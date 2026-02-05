//
//  VaultViewModel.swift
//  The Vault
//
//  Created by Jency on 05/02/26.
//

import Foundation
import Observation

@Observable
class VaultViewModel{
    var isLocked = true
    var notes: [Note] = []
    
    func toggleLock() {
        isLocked.toggle()
    }
    
    func addNote(content:String){
        let newNote = Note(content: content)
        notes.append(newNote)
    }
    
}
