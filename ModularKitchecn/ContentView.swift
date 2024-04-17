//
//  ContentView.swift
//  ModularKitchecn
//
//  Created by Jaya Sabeen on 17/04/24.
//

import SwiftUI
import RealityKit
import ARKit

struct ContentView: View {
    
    @State private var isModelSelcted: Bool = false
    
    var ThreeDModels: [String] = ["Kitchen_Design_Set_V","Painted_wooden_kitchen_cabinet"]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ARViewContainer()
            if isModelSelcted {
                PlaceObjectContainer(isModelSelcted: $isModelSelcted)
            } else {
                ModelsContainer(isModelSelected: $isModelSelcted, ThreeDobjects: ThreeDModels)
            }
        }
    }
}

struct BlueCircleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label.padding().modifier(MakeSquareBounds()).background(Circle().fill(Color.black.opacity(0.3)))

    }
}

struct MakeSquareBounds: ViewModifier {

    @State var size: CGFloat = 1000
    func body(content: Content) -> some View {
        let c = ZStack {
            content.alignmentGuide(HorizontalAlignment.center) { (vd) -> CGFloat in
                DispatchQueue.main.async {
                    self.size = max(vd.height, vd.width)
                }
                return vd[HorizontalAlignment.center]
            }
        }
        return c.frame(width: size, height: size)
    }
}


struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        
    }
    
}

#Preview {
    ContentView()
}
