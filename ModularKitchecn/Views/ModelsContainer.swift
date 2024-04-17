//
//  ModelsContainer.swift
//  ModularKitchecn
//
//  Created by Jaya Sabeen on 17/04/24.
//

import SwiftUI

struct ModelsContainer: View {
    
    @Binding var isModelSelected: Bool
    
    var ThreeDobjects: [String]
    
    var body: some View {
        VStack {
            Spacer()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack() {
                    ForEach(ThreeDobjects.indices, id: \.self) { index in
                        Button {
                            print("Selected model: \(ThreeDobjects[index])")
                            isModelSelected.toggle()
                        } label: {
                            Image(uiImage: UIImage(named: ThreeDobjects[index])!)
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

#Preview {
    ModelsContainer(isModelSelected: .constant(false), ThreeDobjects: MockData.ThreeDModels)
}
