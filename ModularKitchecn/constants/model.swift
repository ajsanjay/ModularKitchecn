//
//  model.swift
//  ModularKitchecn
//
//  Created by Jaya Sabeen on 17/04/24.
//

import UIKit
import RealityKit
import Combine

class Model {
    var modelName: String
    var image: UIImage
    var modelEntity: ModelEntity?
    
    private var cancellable: AnyCancellable? = nil
    
    init(modelName: String) {
        self.modelName = modelName
        self.image = UIImage(named: modelName)!
        let fileName = modelName + ".usdz"
        self.cancellable = ModelEntity.loadModelAsync(named: fileName).sink(receiveCompletion: { loadedResp in
            print("Unable to load model entity")
        }, receiveValue: { modelVal in
            self.modelEntity = modelVal
            print("Successfully loaded \(modelName)")
        })
        
        
//        ModelEntity.loadAsync(named: fileName).sink(receiveCompletion: { loadCompletion in
//            print("Unable to load model entity")
//        }, receiveValue: { modelEnt in
//            self.modelEntity = modelEnt.asModelEntity() // Try to convert to ModelEntity
//            if self.modelEntity != nil {
//                print("Success")
//            } else {
//                print("Received entity is not a ModelEntity")
//            }
//        })
    }
}

extension Entity {
    func asModelEntity() -> ModelEntity? {
        return self as? ModelEntity ?? nil
    }
}
