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
    var ThreeDModels: [String] = ["Kitchen_Design_Set_V","Painted_wooden_kitchen_cabinet"]
    
    var body: some View {
        ZStack {
            ARViewContainer()
            VStack {
                Spacer()
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack() {
                        ForEach(ThreeDModels.indices, id: \.self) { index in
                            Button {
                                print("Selected model: \(ThreeDModels[index])")
                            } label: {
                                Image(uiImage: UIImage(named: ThreeDModels[index])!)
                                    .resizable()
                                    .frame(height: 100)
                                    .aspectRatio(1/1, contentMode: .fit)
                                    .cornerRadius(15)
                            }
                        }
                        .padding()
                    }
                }
                .frame(height: 150)
                .background(Color.black.opacity(0.3))
            }
        }
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
