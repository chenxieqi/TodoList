//
//  SideBarView.swift
//  TodoList
//
//  Created by chen on 2020/07/01.
//  Copyright © 2020 chen. All rights reserved.
//

import SwiftUI

struct SideBarView: View {
    
    @Binding var selected:Int
    
    var body: some View {
        GeometryReader{_ in
        VStack(spacing:25){
            Button(action:{
                self.selected = 0
            }){Image(systemName: "house.fill")
                .imageScale(.medium)
                .foregroundColor(self.selected == 0 ? .black:.gray)
            }
            Button(action:{
                self.selected = 1
            }){Image(systemName: "list.bullet")
                .imageScale(.medium)
                .foregroundColor(self.selected == 1 ? .black:.gray)
            }
            Button(action:{
                self.selected = 2
            }){Image(systemName: "square.and.pencil")
                .imageScale(.medium)
                .foregroundColor(self.selected == 2 ? .black:.gray)
            }
            Button(action:{
                self.selected = 3
            }){Image(systemName: "calendar")
                .imageScale(.medium)
                .foregroundColor(self.selected == 3 ? .black:.gray)
            }
        }.padding(35)
            .background(Color("Color").edgesIgnoringSafeArea(.bottom))
            
            Spacer()
        }
    }
}

struct SideBarView_Previews: PreviewProvider {
    static var previews: some View {
        SideBarView(selected: .constant(1))
    }
}
