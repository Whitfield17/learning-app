//
//  CodeTextView.swift
//  LearningApp
//
//  Created by Braydon Whitfield on 2021-07-15.
//

import SwiftUI

struct CodeTextView: UIViewRepresentable {
        
    @EnvironmentObject var model: ContentModel
    
    func makeUIView(context: Context) -> UITextView {
        
        let textView = UITextView()
        textView.isEditable = false
        
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        
        //Set the attributed text for the lesson
        uiView.attributedText = model.codeText
        
        //Scroll back to the top
        uiView.scrollRectToVisible(CGRect(x: 0, y: 0, width: 1, height: 1), animated: false)
    }
}

struct CodeTextView_Previews: PreviewProvider {
    static var previews: some View {
        CodeTextView()
    }
}
