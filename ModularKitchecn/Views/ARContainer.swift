//
//  ARContainer.swift
//  ModularKitchecn
//
//  Created by Jaya Sabeen on 17/04/24.
//

import SwiftUI
import RealityKit
import ARKit
import FocusEntity

struct ARViewContainer: UIViewRepresentable {
    
    @Binding var objectToDisplay: Model?
    
//    func makeUIView(context: Context) -> ARView {
//        let arView = FocusARView(frame: .zero)
//        ARView(frame: .zero)
//        let configuration = ARWorldTrackingConfiguration()
//        configuration.planeDetection = [.horizontal, .vertical]
//        configuration.environmentTexturing = .automatic
//        if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh) {
//            configuration.sceneReconstruction = .mesh
//        }
//        arView.session.run(configuration)
//        return arView
//        }
    
    func makeUIView(context: Context) -> FocusARView {
        return FocusARView(frame: .zero)
    }
    
    func updateUIView(_ uiView: FocusARView, context: Context) {
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

class FocusARView: ARView {
    enum FocusStyleChoices {
        case classic
        case material
        case color
    }

    /// Style to be displayed in the example
    let focusStyle: FocusStyleChoices = .classic
    var focusEntity: FocusEntity?
    required init(frame frameRect: CGRect) {
        super.init(frame: frameRect)
        self.setupConfig()

        switch self.focusStyle {
        case .color:
            self.focusEntity = FocusEntity(on: self, focus: .plane)
        case .material:
            do {
                let onColor: MaterialColorParameter = try .texture(.load(named: "Add"))
                let offColor: MaterialColorParameter = try .texture(.load(named: "Open"))
                self.focusEntity = FocusEntity(
                    on: self,
                    style: .colored(
                        onColor: onColor, offColor: offColor,
                        nonTrackingColor: offColor
                    )
                )
            } catch {
                self.focusEntity = FocusEntity(on: self, focus: .classic)
                print("Unable to load plane textures")
                print(error.localizedDescription)
            }
        default:
            self.focusEntity = FocusEntity(on: self, focus: .classic)
        }
    }

    func setupConfig() {
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal, .vertical]
        session.run(config)
    }

    @objc required dynamic init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
