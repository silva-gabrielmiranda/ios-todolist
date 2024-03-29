//
//  ContentView.swift
//  todo-list
//
//  Created by Gabriel Miranda on 10/07/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: todoViewModel
    @State var isShowingAlert: Bool = false
    @State var isDarkThemeActive: Bool = false
    
    var body: some View {
        NavigationView {
                VStack{
                    List(viewModel.itens) { item in
                        NavigationLink(destination: TodoDetailsView(item: item, viewModel: viewModel)) {
                            transformItem(item)
                        }
                    }
                    Spacer()
                    insertItemGroup
                }
                .navigationTitle("Lista de tarefas")
                .toolbar {
                    Toggle(isDarkThemeActive ? "🌑" : "☀️",isOn: $isDarkThemeActive)
                        .toggleStyle(.switch)
                }
        }
        .preferredColorScheme( isDarkThemeActive ? .dark : .light )
    }
    
    @ViewBuilder
    private func transformItem(_ item: todo.Item) -> some View {
        HStack {
            Text(item.isCompleted ? "✅" : "⬜️")
                .onTapGesture {
                    withAnimation {
                        viewModel.toggleState(item.id)
                    }
                }
            Text("\(item.title)")
                .strikethrough(item.isCompleted)
                
            Spacer()
            Text("❌")
                .foregroundColor(.red)
                .font(Font.body.bold())
                .onTapGesture {
                    withAnimation {
                        isShowingAlert = true
                    }
                }
                .alert("Deseja apagar essa tarefa?", isPresented: $isShowingAlert) {
                    Button("Quero apagar") {
                        DispatchQueue.main.async {
                            viewModel.removeItem(item.id)
                        }
                    }
                    Button("Não!", role: .cancel) { }
                        .foregroundColor(.red)
                }
        }
    }
    
    private var insertItemGroup: some View {
            NavigationLink(destination: CreateTaskView(modelView: viewModel)) {
                Text("Criar nova tarefa")
                    .font(Font.body.bold())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: todoViewModel())
    }
}
