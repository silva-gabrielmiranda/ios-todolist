//
//  todoModelView.swift
//  todo-list
//
//  Created by Gabriel Miranda on 10/07/22.
//

import SwiftUI

class todoViewModel: ObservableObject {
    
    @Published private var model: todo
        
    var itens: [todo.Item] { model.itens }
    
    init() {
        model = todo()
    }
    
    func addItem(title: String, content: String){
        model.addItem(title: title, content: content)
    }
    
    func removeItem(_ id: Int) {
        model.removeItem(id)
    }
    
    func toggleState(_ id: Int) {
        model.toggleState(id)
    }
    
    func editItem(_ item: todo.Item, newTitle title: String, newContent content: String) {
        model.editItem(item: item, title: title, content: content)
    }
    
}
