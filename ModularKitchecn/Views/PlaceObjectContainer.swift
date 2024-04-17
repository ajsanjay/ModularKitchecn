//
//  PlaceObjectContainer.swift
//  ModularKitchecn
//
//  Created by Jaya Sabeen on 17/04/24.
//

import SwiftUI

struct PlaceObjectContainer: View {
    
    @Binding var isModelSelcted: Bool
    
    var body: some View {
        
        HStack (spacing: 40) {
            Button {
                isModelSelcted.toggle()
                print("Cancel Button selected")
            } label: {
                Image(systemName: "xmark")
                    .frame(width: 50, height: 50)
                    .font(.title)
                    .fontWeight(.bold)
            }
            .buttonStyle(BlueCircleButtonStyle())
            .foregroundColor(.white)
            
            Button {
                isModelSelcted.toggle()
                print("Ok Button selected")
            } label: {
                Image(systemName: "checkmark")
                    .frame(width: 50, height: 50)
                    .font(.title)
                    .fontWeight(.bold)
            }
            .buttonStyle(BlueCircleButtonStyle())
            .foregroundColor(.white)
        }
    }
}

#Preview {
    PlaceObjectContainer(isModelSelcted: .constant(true))
}
