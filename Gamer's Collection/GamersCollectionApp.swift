//
//  Gamer_s_CollectionApp.swift
//  Gamer's Collection
//
//  Created by Rıdvan İmren on 25.01.2022.
//

import SwiftUI

@main
struct Gamer_s_CollectionApp: App {

    var body: some Scene {
        WindowGroup {
            GameListView()
                .environment(\.managedObjectContext, DataController.shared.viewContext)
        }
    }
}
