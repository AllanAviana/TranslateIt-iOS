//
//  TranslateIt_iOSApp.swift
//  TranslateIt-iOS
//
//  Created by Allan Viana on 22/11/24.
//

import SwiftUI

@main
struct TranslateIt_iOSApp: App {
    @StateObject private var viewModel = ViewModel() // Criação única do ViewModel

    var body: some Scene {
        WindowGroup {
           
                ContentView()
                    .environmentObject(viewModel) // Injeta o ViewModel no ambiente
            
        }
    }
}

