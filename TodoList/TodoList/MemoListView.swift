//
//  MemoListView.swift
//  TodoList
//
//  Created by chen on 2020/06/17.
//  Copyright © 2020 chen. All rights reserved.
//

import SwiftUI

struct MemoListView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @State private var newMemo = ""
    
    //@FetchRequest(fetchRequest: Memos.getAllMemos()) var memos:FetchedResults<Memos>
    
    
    var parent_id:String?
    private var request:FetchRequest<Memos>
    private var memos:FetchedResults<Memos>{ request.wrappedValue }
    
    init(parent_id: String?){
        self.parent_id = parent_id
        request = FetchRequest(entity: Memos.entity(), sortDescriptors: [NSSortDescriptor(key: "created_at", ascending:true)],predicate: NSPredicate(format: "parent = %@", self.parent_id!))
    }
 
    
    func getCount()->String{
        var count = 0
        do{
            count = try managedObjectContext.count(for: Memos.getAllMemos())
        }catch{
            print(error)
        }
        return NSNumber(value: count).stringValue
    }
    
    var body: some View {
        VStack{
            List{
            TextField("new memo", text: self.$newMemo)
            Button(action: {
                if self.newMemo != ""{
                    let memos = Memos(context: self.managedObjectContext)
                    memos.title = self.newMemo
                    memos.created_at = Date()
                    memos.id_number = self.getCount()
                    memos.view_date = Date().localString()
                    memos.content = ""
                    memos.parent = self.parent_id
                    
                    do{
                        try self.managedObjectContext.save()
                    }catch{
                        print(error)
                    }
                }
                self.newMemo = ""
                
            }){
                Image(systemName: "plus.circle.fill")
                    .foregroundColor(.green)
                    .imageScale(.large)
            
            }
            if !memos.isEmpty{
                ForEach(memos){memo in
                    NavigationLink(destination: MemoView(txt:"").environmentObject(memo)){
                        showList(title: memo.title!, view_date: memo.view_date!,content: memo.content!)
                        
                    }
                    }.onDelete{
                        indexSet in
                        let deleteItem = self.memos[indexSet.first!]
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

struct MemoListView_Previews: PreviewProvider {
    static var previews: some View {
        MemoListView(parent_id: "")
    }
}

struct showList: View{
    var title: String = ""
    var view_date:String = ""
    var content:String = ""
    
    var body: some View {
        HStack{
        VStack(alignment: .leading){
            
            Text(title).font(.headline)
            Text(view_date).font(.caption)
            Text(content).font(.caption).lineLimit(1)
        }
        }
    }
}
