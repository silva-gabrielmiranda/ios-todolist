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
    
    var body: some View {
        VStack {
            title.font(Font.title.bold())
            HStack {
                ScrollView {
                    Text(item.content)
                        .padding()
                }
                Spacer()
            }
            Spacer()
            bottomOptions
        }
            .alert("Deseja apagar essa tarefa?", isPresented: $isShowingAlert) {
                Button("Quero apagar") {
                    viewModel.removeItem(item.id)
                }
                Button("Não!", role: .cancel) { }
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
            Button("🗑") {
                isShowingAlert = true
            }
                .font(Font.title.bold())
        }
    }
}
