//
//  todo.swift
//  todo-list
//
//  Created by Gabriel Miranda on 10/07/22.
//

import Foundation

struct todo {
    var itens: [Item]
    
    init(){
        itens = []
    }
    
    mutating func addItem(title: String, content: String){
        if let lastItem = itens.last {
            itens.append(Item(title: title, content: content, id: lastItem.id + 1))
        } else {
            itens.append(Item(title: title, content: content, id: 0))
        }
    }
    
    mutating func removeItem(_ id: Int){
        if let index = itens.firstIndex(where: { $0.id == id }){
            itens.remove(at: index)
        }
    }
    
    struct Item: Identifiable {
        var title: String
        var content: String
        var id: Int
    }
}
