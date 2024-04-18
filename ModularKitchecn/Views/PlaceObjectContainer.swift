//
//  PlaceObjectContainer.swift
//  ModularKitchecn
//
//  Created by Jaya Sabeen on 17/04/24.
//

import SwiftUI

struct PlaceObjectContainer: View {
    
    @Binding var isModelSelcted: Bool
    @Binding var selectedModel: Model?
    @Binding var modelForPlacement: Model?
    
    func goBack() {
        isModelSelcted = false
        selectedModel = nil
    }
    
    var body: some View {
        
        HStack (spacing: 40) {
            Button {
                goBack()
                print("Cancel Button selected")
            } label: {
                Image(systemName: "xmark")
                    .frame(width: 50, height: 50)
                    .font(.title)
                    .fontWeight(.bold)
            }
            .buttonStyle(CircleButtonStyle())
            .foregroundColor(.white)
            
            Button {
                modelForPlacement = selectedModel
                goBack()
                print("Ok Button selected")
            } label: {
                Image(systemName: "checkmark")
                    .frame(width: 50, height: 50)
                    .font(.title)
                    .fontWeight(.bold)
            }
            .buttonStyle(CircleButtonStyle())
            .foregroundColor(.white)
        }
    }
}

//#Preview {
//    PlaceObjectContainer(isModelSelcted: .constant(true), selectedModel: .constant("nil"), modelForPlacement: .constant("nil"))
//}
