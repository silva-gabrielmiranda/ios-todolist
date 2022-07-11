//
//  todo_listApp.swift
//  todo-list
//
//  Created by Gabriel Miranda on 10/07/22.
//

import SwiftUI

@main
struct todo_listApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(modelView: todoModelView())
        }
    }
}
