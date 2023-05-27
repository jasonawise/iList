//
//  iListApp.swift
//  iList
//
//  Created by Jason Wise on 5/27/23.
//

import SwiftUI

@main
struct iListApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
