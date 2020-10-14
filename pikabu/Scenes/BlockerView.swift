//
//  BlockerView.swift
//  pikabu
//
//  Created by Fangchen Huang on 2020-09-07.
//  Copyright © 2020 Fangchen Huang. All rights reserved.
//

import SwiftUI

struct BlockerView: View {
    @State private var isLocked = false {
        didSet {
            NotificationCenter.default.post(name: .ShouldLockWindowSize, object: isLocked)
        }
    }

    var body: some View {
        ZStack{
            if isLocked {
                ZStack{
                    VisualEffectView()
                    VStack {
                        Spacer()
                        HStack {
                            Button(action: {
                                self.isLocked.toggle()
                            }) {
                                Image("locked")
                                    .resizable()
                                    .modifier(IconWithBorder(borderColor: .primary))
                            }.buttonStyle(PlainButtonStyle())
                            Spacer()
                        }.padding(.all, 5)
                    }
                }
            } else {
                ZStack{
                    Spacer()
                        .background(Color.black)
                        .opacity(0.6)
                    VStack {
                        Spacer()
                        HStack {
                            Button(action: {
                                self.isLocked.toggle()
                            }) {
                                Image("unlocked")
                                    .resizable()
                                    .modifier(IconWithBorder(borderColor: .primary))
                            }.buttonStyle(PlainButtonStyle())
                            
                            Spacer()
                            Text(LocalizedStringKey("RESIZE_INSTRUCTIONS"))
                            Spacer()

                            Image("resize").resizable().modifier(Icon())
                        }.padding(.all, 5)
                    }
                }
            }
        }.frame(minWidth: 300,
                maxWidth: .infinity,
                minHeight: 60,
                maxHeight: .infinity)
    }
}


struct BlockerView_Previews: PreviewProvider {
    static var previews: some View {
        BlockerView()
    }
}
