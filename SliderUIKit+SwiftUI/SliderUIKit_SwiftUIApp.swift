//
//  SliderUIKit_SwiftUIApp.swift
//  SliderUIKit+SwiftUI
//
//  Created by Вадим Гамзаев on 19.09.2022.
//

import SwiftUI

@main
struct SliderUIKit_SwiftUIApp: App {
    @StateObject private var currentValueTransmitter = TargetValueTransmitter()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(currentValueTransmitter)
        }
    }
}
