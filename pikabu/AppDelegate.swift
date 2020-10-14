//
//  AppDelegate.swift
//  pikabu
//
//  Created by Fangchen Huang on 2020-09-07.
//  Copyright © 2020 Fangchen Huang. All rights reserved.
//

import Cocoa
import SwiftUI
import Combine

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    private var window: NSWindow!
    private var statusItem: NSStatusItem?
    private var statusMenu: NSMenu?
    private var subscribers = Set<AnyCancellable>()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        NSApp.setActivationPolicy(.accessory)
        
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 800, height: 200),
            styleMask: [.resizable],
            backing: .buffered, defer: false)
        window.center()
        window.setFrameAutosaveName("Main Window")
        window.contentView = NSHostingView(rootView: BlockerView())
        
        window.isMovableByWindowBackground = true
        window.level = .floating
        window.isOpaque = false
        window.hasShadow = false
        window.backgroundColor = .clear
        window.collectionBehavior = .canJoinAllSpaces
    
        window.makeKeyAndOrderFront(nil)
        
        observeNotifications()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureMenu()
    }
    
    // MARK:-  Helpers
    private func configureMenu() {
        let statusMenu = NSMenu()
        let infoMenuItem = NSMenuItem(title: "Info", action: #selector(showInfo), keyEquivalent: "i")
        let quitMenuItem = NSMenuItem(title: "Quit", action: #selector(quitApp), keyEquivalent: "q")
        statusMenu.addItem(infoMenuItem)
        statusMenu.addItem(quitMenuItem)
        self.statusMenu = statusMenu
        
        let statusItem = NSStatusBar.system.statusItem(withLength: CGFloat(NSStatusItem.squareLength))
        statusItem.menu = self.statusMenu
        statusItem.button?.image = NSImage(named: "appIcon_outline")
        
        self.statusItem = statusItem
    }
    
    @objc private func quitApp() {
        NSApplication.shared.terminate(self)
    }
    
    @objc private func showInfo() {
        let infoWindow = NSWindow(contentRect: NSRect(x: 0, y: 0, width: 180, height: 200),
                                  styleMask: [.titled, .closable],
                                  backing: .buffered,
                                  defer: false)
        infoWindow.contentView = NSHostingView(rootView: InfoView())
        infoWindow.center()
        
        let infoWindowController = NSWindowController(window: infoWindow)
        infoWindowController.showWindow(self)
    }
    
    private func observeNotifications() {
        NotificationCenter.default.publisher(for: .ShouldLockWindowSize).sink { [unowned self] notification in
            let shouldLockWindowSize = notification.object as! Bool
            self.window.styleMask = shouldLockWindowSize ? [] : [.resizable]
            self.window.isMovableByWindowBackground = !shouldLockWindowSize
        }.store(in: &subscribers)
    }
}
