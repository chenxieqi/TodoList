//
//  MemoCategories.swift
//  TodoList
//
//  Created by chen on 2020/06/17.
//  Copyright © 2020 chen. All rights reserved.
//

import Foundation
import CoreData

public class MemoCategories: NSManagedObject,Identifiable{
    @NSManaged public var name:String?
    @NSManaged public var created_at:Date?
    @NSManaged public var id_number:String?
    
}

extension MemoCategories{
    static func getAllMemoCategories()->NSFetchRequest<MemoCategories>{
        let request:NSFetchRequest<MemoCategories> = MemoCategories.fetchRequest() as! NSFetchRequest<MemoCategories>
        let sortDescriptor = NSSortDescriptor(key: "created_at", ascending: true)
        
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
    
}


