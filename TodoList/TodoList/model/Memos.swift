//
//  Memo.swift
//  TodoList
//
//  Created by chen on 2020/06/18.
//  Copyright © 2020 chen. All rights reserved.
//
import SwiftUI
import Foundation
import CoreData

public class Memos: NSManagedObject,Identifiable{
    
    @NSManaged public var title:String?
    @NSManaged public var content:String?
    @NSManaged public var parent:String?
    @NSManaged public var created_at:Date?
    @NSManaged public var view_date:String?
    @NSManaged public var id_number:String?
    
}

extension Memos{
    
    static func getAllMemos()->NSFetchRequest<Memos>{
        let request: NSFetchRequest<Memos> = Memos.fetchRequest() as! NSFetchRequest<Memos>
        let sortDescriptor = NSSortDescriptor(key: "created_at", ascending: true)
        
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
    
}
