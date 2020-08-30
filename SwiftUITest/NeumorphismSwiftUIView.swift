//
//  NeumorphismSwiftUIView.swift
//  SwiftUITest
//
//  Created by Diptiranjan Rout on 30/08/20.
//  Copyright © 2020 Diptiranjan Rout. All rights reserved.
//

import SwiftUI

struct NeumorphismSwiftUIView: View {
    
    @State private var isToggled = false
    
    var body: some View {
        ZStack {
            
            /// LightUI Spahe
            /*Color.offWhite
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.offWhite)
                .frame(width: 100, height: 100)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)*/
            
            /// Simple Button
            /*Color.offWhite
            Button(action: {
                    print("Action")
                    
                }) {
                    Image(systemName: "video.fill")
                        .foregroundColor(.gray)
                }
            .buttonStyle(SimpleButtonStyle())*/
            
            
            LinearGradient(Color.darkStart, Color.darkEnd)
            HStack(spacing: 40) {
//                Button(action: {
//                        print("Action")
//                        
//                    }) {
//                        Image(systemName: "video.fill")
//                            .foregroundColor(.white)
//                    }
//                .buttonStyle(DarkButtonStyle())
                                
//                Toggle(isOn: $isToggled) {
//                    Image(systemName: "video.fill")
//                    .foregroundColor(.white)
//                }
//                .toggleStyle(DarkToggleStyle())
//                
//                Button(action: {
//                        print("Action")
//                        
//                    }) {
//                        Image(systemName: "video.fill")
//                            .foregroundColor(.white)
//                    }
//                .buttonStyle(ColorfulButtonStyle())
                                
                Toggle(isOn: $isToggled) {
                    Image(systemName: "video.fill")
                    .foregroundColor(.white)
                }
                .toggleStyle(ColorfulToggleStyle())
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    
}

struct NeumorphismSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        NeumorphismSwiftUIView()
    }
}
