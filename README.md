# 🔐 The Vault (SwiftUI + SwiftData)

A modern, secure private note-taking app built with **SwiftUI** and **SwiftData**. This project demonstrates clean MVVM architecture, the new **Observation** framework, and persistent storage in iOS 17+.

## ✨ Features
- **Secure Access**: Lock/Unlock toggle with spring animations.
- **Persistent Storage**: Uses **SwiftData** to ensure your notes are saved permanently.
- **Dynamic Search**: Real-time filtering of secret notes.
- **Custom UI**: Styled using `.insetGrouped` list styles and modern glassmorphism effects.
- **Interactive Transitions**: Smooth UI state changes between the locked and unlocked vault.
- Biometric Security: Integrated LocalAuthentication for industry-standard Face ID and Touch ID protection.

## 🛠 Tech Stack
- **Language**: Swift 5.10+
- Frameworks: SwiftUI, SwiftData, LocalAuthentication
- **Database**: SwiftData
- **Logic**: Observation Framework (`@Observable`)
- **Icons**: Apple SF Symbols 5

- ## 🔒 Security & Privacy
This app utilizes the `LocalAuthentication` framework to ensure your data remains private. 

**Note for Developers:** To run this project on a physical device, ensure the `NSFaceIDUsageDescription` key is present in the `Info.plist`. This provides the mandatory privacy prompt to the user when requesting biometric access.

- ## 📸 Preview
- <img width="1206" height="2622" alt="simulator_screenshot_A96B1D10-DC3F-4EC9-8FE6-160D6BC0FA65" src="https://github.com/user-attachments/assets/98064d2c-8b27-4bc0-8bb9-52a77fe38406" />
 <img width="1206" height="2622" alt="simulator_screenshot_FD1836C6-AA96-42E0-98CF-A10B45C12EDA" src="https://github.com/user-attachments/assets/61ebfd39-9ceb-4b07-aea9-4cf389332159" />
 <img width="1206" height="2622" alt="simulator_screenshot_8DA7B9E4-E842-450F-AE5A-9AB1DCA1889A" src="https://github.com/user-attachments/assets/4ada76c1-d248-41e7-8de4-8a1b1fd3472f" />
