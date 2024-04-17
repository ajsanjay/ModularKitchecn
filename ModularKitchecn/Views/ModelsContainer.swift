//
//  ModelsContainer.swift
//  ModularKitchecn
//
//  Created by Jaya Sabeen on 17/04/24.
//

import SwiftUI

struct ModelsContainer: View {
    
    @Binding var isModelSelected: Bool
    @Binding var selectedModel: Model?
    
    var ThreeDobjects: [Model]
    
    var body: some View {
        VStack {
            Spacer()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack() {
                    ForEach(ThreeDobjects.indices, id: \.self) { index in
                        Button {
                            selectedModel = ThreeDobjects[index]
                            isModelSelected.toggle()
                        } label: {
                            Image(uiImage: ThreeDobjects[index].image)
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

//#Preview {
//    ModelsContainer(isModelSelected: .constant(false), selectedModel: .constant("nil"), ThreeDobjects: MockData.ThreeDModels)
//}
