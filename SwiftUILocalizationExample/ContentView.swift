//
//  ContentView.swift
//  LocalizationExampleSwiftUI
//
//  Created by MAC on 12/5/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewRouter: ViewRouter
    
    var current_language:String = ""
    
    init(viewRouter: ViewRouter) {
        
        self.viewRouter = viewRouter
        
        if LocalPersistance.getLanguage()  == LocalPersistance.lang_eng
        {
            self.current_language = "English"
        }
        else if LocalPersistance.getLanguage() == LocalPersistance.lang_japanese
        {
            self.current_language = "Japanese"
        }
        else
        {
            
        }
    }
    
    
    
    var body: some View {
        
        VStack(alignment:.leading){
            
            Spacer().frame(height: 50)
            VStack(alignment:.center){
                Text("SWIFTUI")
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundColor(Color.green)
                    .multilineTextAlignment(.center)
                
                Text("Localization Demo Example")
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundColor(Color.red)
                    .multilineTextAlignment(.center)
                
                Text("Language : [English - Japanese] ")
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
            } .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0)
            Divider()
            Spacer().frame(height: 20)
            
            Section{
                
                Text("Click Here To >>> Change Language")
                    .foregroundColor(.blue)
                    .multilineTextAlignment(.trailing)
                    .onTapGesture {
                        print("Click Language Settings")
                        self.viewRouter.currentPage = "Settings"
                }
                
                
                Spacer().frame(height: 30)
                
                
                Text("Current Language: \(self.current_language)")
                    .font(.headline)
                    .foregroundColor(.black)
                Divider()
                
                
                Text("content_example")
                    .foregroundColor(.blue)
                Spacer().frame(height:10)
                
                VStack(alignment: .leading)
                {
                    
                    Text("sentence_1")
                    Spacer().frame(height:10)
                    
                    Text("sentence_2")
                    Spacer().frame(height:10)
                    
                    Text("sentence_3")
                    Spacer().frame(height:10)
                    
                    Text("sentence_4")
                    Spacer().frame(height:10)
                    Text("sentence_5")
                    
                }
                
                
                Spacer()
                
                VStack(alignment:.center){
                    Text("Developed by Arif Hossen").fontWeight(.bold).foregroundColor(.green)
                    Text("Senior iOS Developer at Graaho").foregroundColor(.blue)
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottom)
                
                
            }
        }
        .padding()
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter()).environment(\.locale, .init(identifier: LocalPersistance.getLanguage()!))
    }
}
