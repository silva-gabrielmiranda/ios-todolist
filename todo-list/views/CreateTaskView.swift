//
//  todo.create.swift
//  todo-list
//
//  Created by Gabriel Miranda on 14/08/22.
//

import SwiftUI

struct CreateTaskView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var modelView: todoViewModel
    
    
    @State private var title: String = ""
    @State private var content: String = ""
    
    var body: some View {
        VStack {
            Form {
                Section("Título") {
                    titleField
                }
                Section("Descrição") {
                    contentField
                }
            }
            Text("Adicionar tarefa")
                .font(Font.body.bold())
                .foregroundColor(.blue)
                .onTapGesture {
                    withAnimation {
                        modelView.addItem(title: title, content: content)
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
        }
    }
    
    private var titleField: some View {
        TextField("", text: $title)
    }
    
    private var contentField: some View {
        TextEditor(text: $content)
            .textInputAutocapitalization(.never)
    }
    
    
}
