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
    
    mutating func addItem(_ item: String){
        if let lastItem = itens.last {
            itens.append(Item(content: item, id: lastItem.id + 1))
        } else {
            itens.append(Item(content: item, id: 0))
        }
    }
    
    mutating func removeItem(_ id: Int){
        if let index = itens.firstIndex(where: { $0.id == id }){
            itens.remove(at: index)
        }
    }
    
    struct Item: Identifiable {
        var content: String
        var id: Int
    }
}
