//
//  CapShooterApp.swift
//  CapShooter
//
//  Created by 1234567 on 2023/11/18.
//

import SwiftUI

@main
struct CapShooterApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
