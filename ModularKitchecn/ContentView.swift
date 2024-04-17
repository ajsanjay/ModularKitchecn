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
    @State private var wallHeight: Float?
    @State private var wallWidth: Float?
    
    var body: some View {
        VStack {
            ARViewContainer(wallHeight: $wallHeight, wallWidth: $wallWidth)
                .edgesIgnoringSafeArea(.all)
                .frame(height: 300)
            
            if let height = wallHeight, let width = wallWidth {
                Text("Wall Height: \(String(format: "%.2f", height)) meters\nWall Width: \(String(format: "%.2f", width)) meters")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
            } else {
                Text("Tap on a vertical wall to measure...")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
            }
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    @Binding var wallHeight: Float?
    @Binding var wallWidth: Float?
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        arView.session.delegate = context.coordinator
        
        // Enable plane detection for vertical planes
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = [.vertical]
        arView.session.run(configuration)
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
    class Coordinator: NSObject, ARSessionDelegate {
        var parent: ARViewContainer
        
        init(_ parent: ARViewContainer) {
            self.parent = parent
            super.init()
        }
        
        func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
            guard let frame = session.currentFrame else { return }
            
            // Get the screen center point
            let screenCenter = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY)
            
            
            // Perform hit testing from the screen center
            let hitTestResults = frame.hitTest(screenCenter, types: .existingPlaneUsingGeometry)
            
            
            guard let hitResult = hitTestResults.first else { return }
            
            // Make sure the hitResult corresponds to an ARPlaneAnchor
            guard let planeAnchor = hitResult.anchor as? ARPlaneAnchor else { return }
            
            // Calculate wall dimensions
            let height = planeAnchor.extent.z
            let width = planeAnchor.extent.x
            
            // Update the parent's bindings with the measured dimensions
            DispatchQueue.main.async {
                self.parent.wallHeight = height
                self.parent.wallWidth = width
            }
            
            // Optional: Pause the session after detecting the first hit
            session.pause()
        }
    }
}


#Preview {
    ContentView()
}
