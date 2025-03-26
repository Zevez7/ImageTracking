//
//  TrackObjectWithImage.swift
//  TestingObjectCapture
//
//  Created by Dat Nguyen on 3/24/25.
//

import ARKit
import RealityKit
import SwiftUI

struct ImageTrackView: View {
    @Environment(ImageTrackModel.self) var imageTrackModel
    
    var body: some View {
        RealityView { content in
            print("realitView trackobject appear")
            let rootEntity = imageTrackModel.rootEntity
            content.add(rootEntity)
        }.task {
            await imageTrackModel.startSession()
        }.task {
            await imageTrackModel.continousUpdate()
        }
    }
}
