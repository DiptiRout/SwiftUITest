//
//  LinearGradient+Extension.swift
//  SwiftUITest
//
//  Created by Diptiranjan Rout on 30/08/20.
//  Copyright © 2020 Diptiranjan Rout. All rights reserved.
//

import SwiftUI

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

