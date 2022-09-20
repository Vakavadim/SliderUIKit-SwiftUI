//
//  ContentView.swift
//  SliderUIKit+SwiftUI
//
//  Created by Вадим Гамзаев on 19.09.2022.
//
// Алексей, доброй ночи. Сейчас точно проверять не стоит, утром будет финальный комит. ((

import SwiftUI

struct ContentView: View {
    @State private var currentValue = 50.0
    @State private var targetValue = Int.random(in: 1...100)

    
    var body: some View {
        
        VStack (spacing: 16){
            HStack{
                Text("Подвиньте следер как можно к:")
                Text(targetValue.formatted())
            }
            SliderView(value: $currentValue, opacity: $targetValue)
            Button(action: {}) {
                Text("Проверь меня!")
            }
            Button(action: restart) {
                Text("Начать заново")
            }
        }
        .padding()
    }
}

extension ContentView {
    private func restart() {
        self.targetValue = Int.random(in: 1...100)
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

struct SliderView: View {
    @Binding var value: Double
    @Binding var opacity: Int
    
    var body: some View {
        HStack {
            Text("0")
            SliderUIKitView(value: $value)
            Text("100")
        }.opacity((100-(value-Double(opacity)))/100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

