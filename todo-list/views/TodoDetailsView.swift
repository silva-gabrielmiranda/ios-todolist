//
//  todo.details.swift
//  todo-list
//
//  Created by Gabriel Miranda on 13/08/22.
//

import SwiftUI

struct TodoDetailsView: View {
    
    var item: todo.Item
    var viewModel: todoViewModel
    @State var isShowingAlert: Bool = false
    @State var itemContent: String
    @State var itemTitle: String
    @State var isEditing: Bool = false
    
    init(item: todo.Item, viewModel: todoViewModel) {
        self.item = item
        self.viewModel = viewModel
        itemContent = self.item.content
        itemTitle = self.item.title
    }
    
    var body: some View {
        VStack {
            title.font(Font.title.bold())
            viewItemInformation
            Spacer()
            bottomOptions
        }
        .toolbar {
            Image(systemName: "highlighter")
                .onTapGesture {
                    isEditing = !isEditing
                }
        }
        .alert("Deseja apagar essa tarefa?", isPresented: $isShowingAlert) {
            Button("Quero apagar") {
                viewModel.removeItem(item.id)
            }
            Button("Não!", role: .cancel) { }
        }
    }
    
    private var viewItemInformation: some View {
        HStack(alignment: .top) {
            Text(item.content)
                .padding()
            Spacer()
        }
    }
    
    private var editing: some View {
        Form {
            Section("Título") {
                TextField("", text: $itemTitle)
            }
            Section("Descrição") {
                TextEditor(text: $itemContent)
            }
            Button("Salvar") {
                viewModel.editItem(item, newTitle: itemTitle, newContent: itemContent)
                isEditing = false
            }
        }
    }
    
    private var title: some View {
        if item.isCompleted {
            return Text("✅ \(item.title)").foregroundColor(.green)
        }
        return Text(item.title)
    }
    private var bottomOptions: some View {
        VStack {
            Button( item.isCompleted ? "Marcar como pendente" : "Marcar como concluído") {
                viewModel.toggleState(item.id)
            }
                .padding()
            Image(systemName: "trash")
                .resizable()
                .frame(width: 24, height: 30)
                .onTapGesture {
                    isShowingAlert = true
                }
        }
    }
}
