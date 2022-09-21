//
//  ContentView.swift
//  SliderUIKit+SwiftUI
//
//  Created by Вадим Гамзаев on 19.09.2022.
//


import SwiftUI

struct ContentView: View {
    @State private var currentValue = 50.0
    @State private var targetValue = 10.0
    @State private var showAlert = false
    
    var body: some View {
        VStack (spacing: 16){
            Text("Подвиньте слайдер, как можно ближе к: " +  lround(targetValue).formatted())
            SliderView(value: $currentValue, targetValue: $targetValue)
            Button(action: {showAlert.toggle()}) {
                Text("Проверь меня!")
            }
            Button(action: restart) {
                Text("Начать заново")
            }
        }
        .padding()
        .onAppear{
            restart()
        }
        .alert("Your scoore", isPresented: $showAlert, actions: {}) {
            Text(computeScore().formatted())
        }
    }
}

extension ContentView {

    private func restart() {
        targetValue = Double.random(in: 1...100)
    }
    
    private func computeScore() -> Int {
        let difference = abs(Int(targetValue) - lround(currentValue))
        return 100 - difference
    }
}

struct SliderView: View {
    @Binding var value: Double
    @Binding var targetValue: Double

    var body: some View {
        HStack {
            Text("0")
            SliderUIKitView(value: $value, targetValue: $targetValue)
            Text("100")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

