//
//  SliderUIKitView.swift
//  SliderUIKit+SwiftUI
//
//  Created by Вадим Гамзаев on 19.09.2022.
//

import SwiftUI

class UISliderX: UISlider {
    var targetValue: Double?
}

struct SliderUIKitView: UIViewRepresentable {
    @Binding var value: Double
    @Binding var targetValue: Double

    private func computeScore() -> Int {
        let difference = abs(Int(targetValue) - lround(value))
        return 100 - difference
    }
    
    func makeUIView(context: Context) -> UISliderX {
        let slider = UISliderX()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.thumbTintColor = UIColor(.red)
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChange(_:)),
            for: .valueChanged)
        return slider
    }
    
    func updateUIView(_ slider: UISliderX, context: Context) {
        slider.value = Float(value)
        slider.targetValue = targetValue
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChange(_:)),
            for: .valueChanged
        )
        slider.layer.opacity = (Float(computeScore()))/100
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value, targetValue: $targetValue)
    }
}

extension SliderUIKitView {
   final class Coordinator: NSObject {
       var value: Binding<Double>
       var targetValue: Binding<Double>
        
        init(value: Binding<Double>, targetValue: Binding<Double>) {
            self.value = value
            self.targetValue = targetValue
        }

        @objc func valueChange(_ sender: UISliderX) {
            self.value.wrappedValue = Double(sender.value)
            self.targetValue.wrappedValue = sender.targetValue ?? 0
        }
    }
}

struct SliderUIKitView_Previews: PreviewProvider {
    static var previews: some View {
        SliderUIKitView(value: .constant(100), targetValue: .constant(100))
    }
}
