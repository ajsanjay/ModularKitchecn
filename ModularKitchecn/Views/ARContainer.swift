//
//  ARContainer.swift
//  ModularKitchecn
//
//  Created by Jaya Sabeen on 17/04/24.
//

import SwiftUI
import RealityKit
import ARKit

struct ARViewContainer: UIViewRepresentable {
    
    @Binding var objectToDisplay: Model?
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = [.horizontal, .vertical]
        configuration.environmentTexturing = .automatic
        if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh) {
            configuration.sceneReconstruction = .mesh
        }
        arView.session.run(configuration)
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        if let objectName = objectToDisplay {
            if let model = objectName.modelEntity {
                print("Adding 3d to scene")
                let anchor = AnchorEntity(plane: .any)
                anchor.addChild(model)
                uiView.scene.addAnchor(anchor)
            } else {
                print("Unable to load \(objectName.modelName)")
            }
            DispatchQueue.main.async {
                objectToDisplay = nil
            }
        }
    }
    
}
