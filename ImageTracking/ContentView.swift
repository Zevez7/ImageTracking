//
//  ContentView.swift
//  TestingObjectCapture
//
//  Created by Dat Nguyen on 3/24/25.
//

import SwiftUI
import RealityKit
 

struct ContentView: View {
    @Environment(\.openImmersiveSpace) var openImmersiveSpace

    var body: some View {
       
        Text("Image Tracking")
            .font(.largeTitle)
        
        
        
        .onAppear{
            Task{
                await openImmersiveSpace(id:"ImmersiveSpace")
            }
        }
    }
}

