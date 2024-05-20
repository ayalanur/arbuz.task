//
//  arbuzApp.swift
//  arbuz
//
//  Created by Ayala Nurkuatkyzy on 19.05.2024.
//

import SwiftUI

@main
struct arbuzApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
