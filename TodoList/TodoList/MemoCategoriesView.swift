//
//  MemoCategoriesView.swift
//  TodoList
//
//  Created by chen on 2020/06/17.
//  Copyright © 2020 chen. All rights reserved.
//

import SwiftUI

struct MemoCategoriesView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: MemoCategories.getAllMemoCategories()) var memoCategories:FetchedResults<MemoCategories>
    @State private var newCategory = ""
    
    var body: some View {
        NavigationView{
        VStack{
        List{
        TextField("new Category", text: self.$newCategory)
            Button(action: {
            if self.newCategory != ""{
                let memoCategory = MemoCategories(context: self.managedObjectContext)
                memoCategory.name = self.newCategory
                memoCategory.created_at = Date()
                memoCategory.id_number = String(self.memoCategories.count)
                
                do{
                    try self.managedObjectContext.save()
                }catch{
                    print(error)
                }
            }
            self.newCategory = ""
            
        }){
            Image(systemName: "plus.circle.fill")
                .foregroundColor(.green)
                .imageScale(.large)
        
        }
            if !memoCategories.isEmpty{
                ForEach(memoCategories){memoCategory in
                    NavigationLink(destination: MemoListView(parent_id: memoCategory.id_number!)){
                    
                        Text(memoCategory.name!).font(.headline)
                    }
                    }.onDelete{
                        indexSet in
                        let deleteItem = self.memoCategories[indexSet.first!]
                        self.managedObjectContext.delete(deleteItem)
                        
                        do{
                            try self.managedObjectContext.save()
                        }catch{
                            print(error)
                        }
                    }
                }
            }
        }
        }
    }
}

struct MemoCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        MemoCategoriesView()
    }
}
