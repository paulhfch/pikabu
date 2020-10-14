//
//  InfoView.swift
//  pikabu
//
//  Created by Fangchen Huang on 2020-10-14.
//  Copyright © 2020 Fangchen Huang. All rights reserved.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        VStack {
            Text("Pikabu")
                .font(.title)
            
            Image("appIcon_color")
                .padding()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.primary, lineWidth: 5))
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .frame(idealWidth: 80, idealHeight: 80)
            Text("Version \(AppDelegate.appVersion)")
            
            Divider()
            Text("Paul Fangchen Huang")
            Button(action: {
                launchTwitterWebPage()
            }, label: {
                Text("@paulhfch")
                    .foregroundColor(.blue)
            }).buttonStyle(BorderlessButtonStyle())
        }.padding()
    }
    
    private func launchTwitterWebPage() {
        let url = URL(string: "https://twitter.com/paulhfch")!
        NSWorkspace.shared.open(url)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            InfoView().environment(\.colorScheme, .dark)
            InfoView().environment(\.colorScheme, .light)
        }
    }
}
