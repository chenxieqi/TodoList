//
//  ToDoItemsListView.swift
//  TodoList
//
//  Created by chen on 2020/06/15.
//  Copyright © 2020 chen. All rights reserved.
//

import SwiftUI

extension Date {
    func localString(dateStyle: DateFormatter.Style = .short, timeStyle: DateFormatter.Style = .short) -> String {
        return DateFormatter.localizedString(from: self, dateStyle: dateStyle, timeStyle: timeStyle)
    }
}
struct ToDoItemsListView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: ToDoItems.getAllToDoItems()) var toDoItems:FetchedResults<ToDoItems>
    
    @State private var newItem = ""
    
    var body: some View {
        NavigationView{
        List{
            Section(header:Text("What's next?")){
                HStack{
                TextField("new item", text: self.$newItem)
                Button(action: {
                    if self.newItem != ""{
                        let toDoItem = ToDoItems(context: self.managedObjectContext)
                        toDoItem.item = self.newItem
                        toDoItem.created_date = Date()
                        toDoItem.view_date = Date().localString()
                        
                        do{
                            try self.managedObjectContext.save()
                        }catch{
                            print(error)
                        }
                    }
                    self.newItem = ""
                    
                }){
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(.green)
                        .imageScale(.large)
                
                }
                }
            }.font(.headline)
            Section(header:Text("To Do's")){
                ForEach(self.toDoItems){
                    toDoItem in
                    ToDoItemsView(item: toDoItem.item!, view_date: toDoItem.view_date!)
                }.onDelete{
                    indexSet in
                    let deleteItem = self.toDoItems[indexSet.first!]
                    self.managedObjectContext.delete(deleteItem)
                    
                    do{
                        try self.managedObjectContext.save()
                    }catch{
                        print(error)
                    }
                }
            }
            
        }.navigationBarTitle(Text("ToDo List"),displayMode: .inline)
            .navigationBarItems(trailing: EditButton())
            
        }
    }
}

struct ToDoItemsListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemsListView()
    }
}
