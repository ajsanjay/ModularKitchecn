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
    
    var ThreeDModels: [Model] = [Model(modelName: "Kitchen_Design_Set_V"), Model(modelName: "Painted_wooden_kitchen_cabinet"), Model(modelName: "teapot"), Model(modelName: "flower_tulip"), Model(modelName: "cup_saucer_set")]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ARViewContainer(objectToDisplay: $modelForPlacement)
            if isModelSelcted {
                PlaceObjectContainer(isModelSelcted: $isModelSelcted, selectedModel: $selectedModel, modelForPlacement: $modelForPlacement)
            } else {
                ModelsContainer(isModelSelected: $isModelSelcted, selectedModel: $selectedModel, ThreeDobjects: ThreeDModels)
            }
        }
    }
}

#Preview {
    ContentView()
}
