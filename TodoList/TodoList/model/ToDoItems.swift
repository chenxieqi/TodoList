//
//  TodoItems.swift
//  TodoList
//
//  Created by chen on 2020/06/15.
//  Copyright © 2020 chen. All rights reserved.
//

import Foundation
import CoreData

public class ToDoItems: NSManagedObject,Identifiable{
    
    @NSManaged public var created_date:Date?
    @NSManaged public var item:String?
    @NSManaged public var view_date:String?
    
}

extension ToDoItems{
    static func getAllToDoItems()->NSFetchRequest<ToDoItems>{
        let request:NSFetchRequest<ToDoItems> = ToDoItems.fetchRequest() as! NSFetchRequest<ToDoItems>
        let sortDescriptor = NSSortDescriptor(key: "created_date", ascending: true)
        
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}
