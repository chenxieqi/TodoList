//
//  ContentView.swift
//  TodoList
//
//  Created by chen on 2020/06/14.
//  Copyright © 2020 chen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var selected = 0
    @State var show = false
    @State var home = false
    var body: some View {
        
        ZStack{
            GeometryReader{
                geo in
            
                if self.selected == 0{
                    DocumentScanView(recognizedText: "")
                }else if self.selected == 1{
                    ToDoItemsListView()
                }else if self.selected == 2{
                    MemoCategoriesView()
                }else if self.selected == 3{
                    //MemoView(txt: "")
                }
            }.background(Color.white)
                .padding(.bottom, 40)

            ButtonBarView(selected: self.$selected)
        }
 
 /*       NavigationView{
            ZStack{
                if self.selected == 0{
                    Text("Home Page")
                }else if self.selected == 1{
                    ToDoItemsListView()
                }else if self.selected == 2{
                    MemoCategoriesView()
                    //MemoListView()
                }else if self.selected == 3{
                    //MemoView(txt: "")
                }
                SideBarView(selected: self.$selected).offset(x: self.show ? 0 : -UIScreen.main.bounds.width)
                    .animation(.default)
            }.navigationBarTitle("Home",displayMode: .inline)
            .navigationBarItems(leading:
                Button(action: {
                    self.show.toggle()
                }, label: {
                    Image(systemName: "house.fill")
                        .renderingMode(.original)
                })
        }
        )
      */
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


