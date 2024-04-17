//
//  ContentView.swift
//  ModularKitchecn
//
//  Created by Jaya Sabeen on 17/04/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isModelSelcted: Bool = false
    @State private var selectedModel: Model?
    @State private var modelForPlacement: Model?
    
    var ThreeDModels: [Model] = [Model(modelName: "Kitchen_Design_Set_V"), Model(modelName: "Painted_wooden_kitchen_cabinet")]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ARViewContainer(objectToDisplay: $modelForPlacement)
            if isModelSelcted {
                PlaceObjectContainer(isModelSelcted: $isModelSelcted, selectedModel: $selectedModel, modelForPlacement: $modelForPlacement)
            } else {
                ModelsContainer(isModelSelected: $isModelSelcted, selectedModel: $modelForPlacement, ThreeDobjects: ThreeDModels)
            }
        }
    }
}

#Preview {
    ContentView()
}
