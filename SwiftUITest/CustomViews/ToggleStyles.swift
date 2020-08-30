//
//  ToggleStyles.swift
//  SwiftUITest
//
//  Created by Diptiranjan Rout on 30/08/20.
//  Copyright © 2020 Diptiranjan Rout. All rights reserved.
//

import SwiftUI

struct DarkToggleStyle: ToggleStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }) {
            configuration.label
            .padding(30)
            .contentShape(Circle())
        }.background(DarkBackGround(isHighlighted: configuration.isOn, shape: Circle()))
    }
}

struct ColorfulToggleStyle: ToggleStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }) {
            configuration.label
            .padding(30)
            .contentShape(Circle())
        }.background(ColorfulBackGround(isHighlighted: configuration.isOn, shape: Circle()))
    }
}

