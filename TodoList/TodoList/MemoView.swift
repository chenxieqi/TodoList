//
//  MemoView.swift
//  TodoList
//
//  Created by chen on 2020/06/17.
//  Copyright © 2020 chen. All rights reserved.
//

import SwiftUI
import CoreData

struct MemoView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @State var txt:String=""
    @EnvironmentObject private var memo:Memos
    
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0){
            if memo.isFault{
                Text("")
            }else{
                MultilineTF(memo:memo, txt:$txt)
            }
        }.onDisappear{
            self.SaveData()
        }
    }
    
    private func SaveData(){
        if !(txt == "") && !memo.isFault{
            self.memo.content = self.txt
            
            do{
                try self.managedObjectContext.save()
            }catch{
                print(error)
            }
        }
    }
}


struct MemoView_Previews: PreviewProvider {
    static var previews: some View {
        MemoView(txt: "")
    }
}


struct MultilineTF: UIViewRepresentable{
    
    var memo:Memos

    @Binding var txt:String
    
    func makeCoordinator() -> MultilineTF.Coordinator {
        return MultilineTF.Coordinator(parent1: self)
    }
    
    func makeUIView(context: UIViewRepresentableContext<MultilineTF>) -> UITextView {
        
        let tview = UITextView()
        tview.isEditable = true
        tview.isUserInteractionEnabled = true
        tview.isScrollEnabled = true
        tview.font = .systemFont(ofSize: 20)
        tview.delegate = context.coordinator
        if memo.content == ""{
            tview.text = "Type Here"
            tview.textColor = .gray
        }else{
            tview.text = memo.content
            tview.textColor = .black
        }
        
        return tview
        
    }
    
    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<MultilineTF>) {
    }
    
    
    class Coordinator: NSObject,UITextViewDelegate{
         
        var parent: MultilineTF
        
        init(parent1: MultilineTF){
            parent = parent1
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            if textView.textColor == .gray{
                textView.text = ""
                textView.textColor = .black
            }
            
        }
        func textViewDidChange(_ textView: UITextView) {
            self.parent.txt = textView.text
        }
        
    }
}
