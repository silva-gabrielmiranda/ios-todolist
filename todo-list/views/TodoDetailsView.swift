//
//  todo.details.swift
//  todo-list
//
//  Created by Gabriel Miranda on 13/08/22.
//

import SwiftUI

struct TodoDetailsView: View {
    
    var item: todo.Item
    
    var body: some View {
        VStack {
            Text(item.title)
                .font(Font.title.bold())
            HStack {
                Text(item.content)
                    .padding()
                Spacer()
            }
            Spacer()
        }
    }
}
