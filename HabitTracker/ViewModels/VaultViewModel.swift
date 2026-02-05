//
//  VaultViewModel.swift
//  The Vault
//
//  Created by Jency on 05/02/26.
//

import Foundation
import Observation
import LocalAuthentication
import SwiftUI

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
    
    func authenticate(){
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Unlock your secrets"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                if success {
                    DispatchQueue.main.async {
                        withAnimation(.spring()){
                            self.isLocked = true
                        }
                    }
                }else {
                    print("Authentication failed")
                }
                
            }
            
        }else {
            self.isLocked = false
        }
    }
    
}
