//
//  ButtonStyles.swift
//  SwiftUITest
//
//  Created by Diptiranjan Rout on 30/08/20.
//  Copyright © 2020 Diptiranjan Rout. All rights reserved.
//

import SwiftUI

struct SimpleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.all, 30)
            .contentShape(Circle())
            .background(
                Group{
                    if configuration.isPressed {
                        Circle().fill(Color.offWhite)
                            .overlay(
                                Circle()
                                    .stroke(Color.gray, lineWidth: 4)
                                    .blur(radius: 4)
                                    .offset(x: 2, y: 2)
                                    .mask(Circle().fill(LinearGradient(Color.black, Color.clear)))
                        )
                            .overlay(
                                Circle()
                                    .stroke(Color.white, lineWidth: 8)
                                    .blur(radius: 4)
                                    .offset(x: -2, y: -2)
                                    .mask(Circle().fill(LinearGradient(Color.clear, Color.black)))
                        )
                    }
                    else {
                        Circle().fill(Color.offWhite)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                    }
            })}
}


struct DarkButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.all, 30)
            .contentShape(Circle())
            .background(
                DarkBackGround(isHighlighted: configuration.isPressed, shape: Circle())
        )
    }
}

struct ColorfulButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.all, 30)
            .contentShape(Circle())
            .background(
                ColorfulBackGround(isHighlighted: configuration.isPressed, shape: Circle())
        )
    }
}
