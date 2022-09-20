//
//  SliderUIKitView.swift
//  SliderUIKit+SwiftUI
//
//  Created by Вадим Гамзаев on 19.09.2022.
//

import SwiftUI

struct SliderUIKitView: UIViewRepresentable {
    
    @Binding var value: Double
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.thumbTintColor = UIColor(.red)
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
    
}

extension SliderUIKitView {
    class Coordinator: NSObject {
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func didTapDone(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

struct SliderUIKitView_Previews: PreviewProvider {
    static var previews: some View {
        SliderUIKitView(value: .constant(100))
    }
}
