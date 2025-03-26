//
//  TestingObjectCaptureApp.swift
//  TestingObjectCapture
//
//  Created by Dat Nguyen on 3/24/25.
//

import SwiftUI

@main
struct MainView: App {

    @State private var imageTrackModel = ImageTrackModel()

    var body: some Scene {
        WindowGroup {
            ContentView().environment(imageTrackModel)
        }
        
        ImmersiveSpace(id: "ImmersiveSpace") {
            ImageTrackView()
                .environment(imageTrackModel)
        }
    }
}
