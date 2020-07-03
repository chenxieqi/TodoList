//
//  FilteredData.swift
//  TodoList
//
//  Created by chen on 2020/06/22.
//  Copyright © 2020 chen. All rights reserved.
//

import SwiftUI
import CoreData

struct FilteredDataView{
    var fetchRequest: FetchRequest<Memos>
    var memos: FetchedResults<Memos>{ fetchRequest.wrappedValue }

    init(filterKey:String,filterValue:String){
        fetchRequest = FetchRequest<Memos>(entity: Memos.entity(), sortDescriptors: [],predicate: NSPredicate(format: "%K = %@", filterKey,filterValue))
    }
    
    func getData()->FetchedResults<Memos>{
        return memos
    }

}


