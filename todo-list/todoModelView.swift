//
//  todoModelView.swift
//  todo-list
//
//  Created by Gabriel Miranda on 10/07/22.
//

import SwiftUI

class todoModelView: ObservableObject {
    
    @Published private var model: todo
    
    var itens: [todo.Item] { model.itens }
    
    init() {
        model = todo()
    }
    
    func addItem(_ item: String){
        model.addItem(item)
    }
    
    func removeItem(_ id: Int) {
        model.removeItem(id)
    }
    
}
