//
//  ImageTrack.swift
//  TestingObjectCapture
//
//  Created by Dat Nguyen on 3/24/25.
//

import ARKit
import RealityKit

@MainActor
@Observable
class ImageTrackModel {
    let session = ARKitSession()
    var entityMap: [UUID: ModelEntity] = [:]
    let rootEntity = Entity()
    let imageInfo = ImageTrackingProvider(
        referenceImages: ReferenceImage.loadReferenceImages(
            inGroupNamed: "ARResource")
    )
    var isRunning = false

    func startSession() async {

        do {
            if ImageTrackingProvider.isSupported {
                try await session.run([imageInfo])
                print("Session started successfully.")
                print("Running AR session...")
            }

        } catch {
            print("Error running AR session: \(error)")
        }

    }

    func continousUpdate() async {
        // Check if anchor updates are being received
        for await update in imageInfo.anchorUpdates {
            print("Anchor update received for anchor ID: \(update.anchor.id)")
        
            updateImage(update.anchor)
        }
    }

    func updateImage(_ anchor: ImageAnchor) {
        print("update Image")
        if entityMap[anchor.id] == nil {
            let material = SimpleMaterial(color: .blue, isMetallic: true)
            let entity = ModelEntity(
                mesh: .generateSphere(radius: 0.10), materials: [material])

            entityMap[anchor.id] = entity
            rootEntity.addChild(entity)
        }

        if anchor.isTracked {
            entityMap[anchor.id]?.transform = Transform(
                matrix: anchor.originFromAnchorTransform)
        }
    }

}
