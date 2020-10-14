//
//  VIsualEffectView.swift
//  pikabu
//
//  Created by Fangchen Huang on 2020-09-07.
//  Copyright © 2020 Fangchen Huang. All rights reserved.
//

import SwiftUI

// https://stackoverflow.com/a/61458115
struct VisualEffectView: NSViewRepresentable {
    var material = NSVisualEffectView.Material.fullScreenUI
    var blendingMode = NSVisualEffectView.BlendingMode.behindWindow
    
    func makeNSView(context: Context) -> NSVisualEffectView {
        let visualEffectView = NSVisualEffectView()
        visualEffectView.material = material
        visualEffectView.blendingMode = blendingMode
        visualEffectView.state = NSVisualEffectView.State.active
        return visualEffectView
    }

    func updateNSView(_ visualEffectView: NSVisualEffectView, context: Context) {
        visualEffectView.material = material
        visualEffectView.blendingMode = blendingMode
    }
}
