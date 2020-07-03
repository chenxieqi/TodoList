//
//  ToDoItemsView.swift
//  TodoList
//
//  Created by chen on 2020/06/15.
//  Copyright © 2020 chen. All rights reserved.
//

import SwiftUI

struct ToDoItemsView: View {
    var item: String = ""
    var view_date:String = ""
    
    var body: some View {
        HStack{
        VStack(alignment: .leading){
            Text(item).font(.headline)
            Text(view_date).font(.caption)
        }
        }
    }
}

struct ToDoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemsView(item: "a", view_date: "bb")
    }
}
