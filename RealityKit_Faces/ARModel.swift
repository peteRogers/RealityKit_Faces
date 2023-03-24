//
//  ARModel.swift
//  RealityKit_SwiftUI_MVVM_Tutorial
//
//  Created by Cole Dennis on 10/1/22.
//

import Foundation
import RealityKit
import ARKit

struct ARModel {
    private(set) var arView : ARView
    private var experience: Experience.FaceScene
    
    init() {
        arView = ARView(frame: .zero)
        experience = try! Experience.loadFaceScene()
        let faceTrackingConfig = ARFaceTrackingConfiguration()
        arView.session.run(faceTrackingConfig)
        arView.scene.anchors.append(experience)
    }
    
    func showSunglasses(show:Bool){
        if(show == true ){
            experience.notifications.showGlasses.post()
        }else{
            experience.notifications.hideGlasses.post()
        }
    }
    
    func showHat(show:Bool){
        if(show == true ){
            experience.notifications.showHat.post()
        }else{
            experience.notifications.hideHat.post()
        }
    }
    
   
    
}
