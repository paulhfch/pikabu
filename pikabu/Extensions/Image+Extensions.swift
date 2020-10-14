//
//  Image+Extensions.swift
//  pikabu
//
//  Created by Fangchen Huang on 2020-09-09.
//  Copyright © 2020 Fangchen Huang. All rights reserved.
//

import SwiftUI

struct Icon: ViewModifier {
    func body(content: Content) -> some View {
        content.frame(width: 20, height: 20)
    }
}

struct IconWithBorder: ViewModifier {
    let borderColor: Color
    
    func body(content: Content) -> some View {
        content.frame(width: 15, height: 15)
            .padding(.all, 3)
            .border(borderColor, width: 1)
    }
}

//extension Image {
//    func asIcon(withBorder: Bool = false) -> some View {
//        if withBorder {
//            return self.modifier(Icon())
//        } else {
//            return self.modifier(IconWithBorder())
//        }
//    }
//}
