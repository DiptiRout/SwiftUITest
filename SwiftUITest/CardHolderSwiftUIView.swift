//
//  CardHolderSwiftUIView.swift
//  SwiftUITest
//
//  Created by Diptiranjan Rout on 31/08/20.
//  Copyright © 2020 Diptiranjan Rout. All rights reserved.
//

import SwiftUI

struct CardHolderSwiftUIView: View {
    var body: some View {
        ZStack {
            /// LightUI Spahe
            Color.cardWhite
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.cardWhite)
                .frame(width: 100, height: 100)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct CardHolderSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CardHolderSwiftUIView()
    }
}
