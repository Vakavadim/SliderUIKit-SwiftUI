//
//  SliderUIKitView.swift
//  SliderUIKit+SwiftUI
//
//  Created by Вадим Гамзаев on 19.09.2022.
//

import SwiftUI

struct SliderUIKitView: UIViewRepresentable {
    
    @Binding var value: Double
    @EnvironmentObject private var valueTransmitter: TargetValueTransmitter
    
    private func computeScore() -> Int {
        let difference = abs(Int(valueTransmitter.targetValue) - lround(value))
        return 100 - difference
    }
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.thumbTintColor = UIColor(.red)
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChange(_:)),
            for: .valueChanged)
        return slider
    }
    
    func updateUIView(_ slider: UISlider, context: Context) {
        slider.value = Float(value)
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChange(_:)),
            for: .valueChanged
        )
        slider.layer.opacity = (Float(computeScore()))/100
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

extension SliderUIKitView {
   final class Coordinator: NSObject {
       var value: Binding<Double>
        
        init(value: Binding<Double>) {
            self.value = value
        }

        @objc func valueChange(_ sender: UISlider) {
            self.value.wrappedValue = Double(sender.value)
        }
    }
}

struct SliderUIKitView_Previews: PreviewProvider {
    static var previews: some View {
        SliderUIKitView(value: .constant(100))
    }
}
