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
            Text(item.title)
                .font(Font.title.bold())
            HStack {
                ScrollView {
                    Text(item.content)
                        .padding()
                }
                Spacer()
            }
            Spacer()
            Button("🗑") {
                isShowingAlert = true
            }
                .font(Font.title.bold())
        }
            .alert("Deseja apagar essa tarefa?", isPresented: $isShowingAlert) {
                Button("Quero apagar") {
                    viewModel.removeItem(item.id)
                }
                Button("Não!", role: .cancel) { }
            }
    }
}
