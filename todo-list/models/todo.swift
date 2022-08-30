//
//  todo.swift
//  todo-list
//
//  Created by Gabriel Miranda on 10/07/22.
//

import Foundation

struct todo: Codable {
    var itens: [Item]
    
    init(){
        itens = [
            Item(isCompleted: false, title: "Esta é uma tarefa", content: "Tarefa de tarefar\nMuitas tarefas", id: 0),
            Item(title: "Esta é uma outra tarefa", content: "Tarefa de tarefar\nMuitas tarefas", id: 1)
        ]
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
    
    mutating func toggleState(_ id: Int){
        if let index = itens.firstIndex(where: { $0.id == id }){
            itens[index].isCompleted = !itens[index].isCompleted
        }
    }
    
    mutating func editItem(item: Item, title: String, content: String) {
        if let index = itens.firstIndex(where: { $0.id == item.id }){
            itens[index].title = title
            itens[index].content = content
        }
    }
    
    struct Item: Identifiable, Codable {
        var isCompleted: Bool = false
        var title: String
        var content: String
        var id: Int
    }
}
