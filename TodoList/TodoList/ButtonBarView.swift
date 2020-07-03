//
//  ButtonBarView.swift
//  TodoList
//
//  Created by chen on 2020/06/17.
//  Copyright © 2020 chen. All rights reserved.
//

import SwiftUI

struct ButtonBarView: View {
    
    @Binding var selected:Int
    
    var body: some View {
        VStack{
            Spacer()
            ButtonBar(selected: self.$selected)
                .padding()
                .padding(.horizontal,22)
                .background(CurvedShape())
        }
    }
}

struct ButtonBarView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonBarView(selected: .constant(1))
    }
}

struct CurvedShape: View{
    var body: some View{
        Path{
            path in
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 0))
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 45))
            path.addLine(to: CGPoint(x: 0, y: 45))
        }.fill(Color.white)
            .rotationEffect(.init(degrees: 180))
            .shadow(radius: 10)
    }
    
}

struct ButtonBar: View {
    
    @Binding var selected: Int
    
    var body: some View{
        HStack{
            Button(action:{
                self.selected = 0
            }){Image(systemName: "house.fill")
                .imageScale(.large)
                .foregroundColor(self.selected == 0 ? .black:.gray)
            }
            Spacer(minLength: 15)
            Button(action:{
                self.selected = 1
            }){Image(systemName: "list.bullet")
                .imageScale(.large)
                .foregroundColor(self.selected == 1 ? .black:.gray)
            }
            Spacer(minLength: 15)
            Button(action:{
                self.selected = 2
            }){Image(systemName: "square.and.pencil")
                .imageScale(.large)
                .foregroundColor(self.selected == 2 ? .black:.gray)
            }
            Spacer(minLength: 15)
            Button(action:{
                self.selected = 3
            }){Image(systemName: "calendar")
                .imageScale(.large)
                .foregroundColor(self.selected == 3 ? .black:.gray)
            }
            
        }
    }
}
