//
//  LandmarksApp.swift
//  Shared
//
//  Created by Bhaskar on 06/01/22.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modalData = ModalData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modalData)
        }
    }
}
