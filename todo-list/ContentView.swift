//
//  ContentView.swift
//  todo-list
//
//  Created by Gabriel Miranda on 10/07/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var modelView: todoModelView
    @State var newItem: String = ""
    @State var showingAlert: Bool = false
    
    var body: some View {
        VStack{
            
            List(modelView.itens) { item in
                HStack {
                    Text(item.content)
                    Spacer()
                    Text("X")
                        .foregroundColor(.red)
                        .font(Font.body.bold())
                        .onTapGesture {
                            withAnimation {
                                showingAlert = true
                            }
                        }
                        .alert("Deseja apagar este item?", isPresented: $showingAlert) {
                            Button("Apagar") {
                                modelView.removeItem(item.id)
                            }
                            Button("Cancelar", role: .cancel) { }
                        }
                }
            }
            
            Spacer()
            
            TextField(text: $newItem ) {
                Text("Digite seu novo item")
            }
            .padding(.horizontal)
            .onSubmit {
                withAnimation{
                    addItem()
                }
            }
            
            Text("Adicionar item")
                .padding()
                .foregroundColor(.blue)
                .font(Font.body.weight(.bold))
                .onTapGesture {
                    withAnimation{
                        addItem()
                    }
                }
        }
    }
    private func addItem(){
        modelView.addItem(newItem)
        newItem = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(modelView: todoModelView())
    }
}
