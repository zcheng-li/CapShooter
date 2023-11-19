//
//  ImmersiveView.swift
//  CapShooter
//
//  Created by 1234567 on 2023/11/18.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    
    
    var tap: some Gesture {
        SpatialTapGesture()
            .targetedToAnyEntity()
            .onEnded { value in
                print(value.entity)
            }
    }
    
    var shoot: some Gesture {
        DragGesture()
            .targetedToAnyEntity()
            .onChanged { value in
//                print(value.predictedEndTranslation3D.vector)
            }
            .onEnded { value in
                var force = SIMD3<Float>(value.predictedEndTranslation3D.vector) * 0.001
//                force.y = -force.y
//                print(force)
//                var position = SIMD3<Float>(value.startLocation3D.vector) - value.entity.position
                
                (value.entity as? HasPhysics)?.addForce(force, relativeTo: value.entity)
                
            }
    }
    
    
    var body: some View {
        RealityView(make: {content, attachments in
            // Add the initial RealityKit content
            if let gamePlane = try? await Entity(named: "game_plane", in: realityKitContentBundle) {
                content.add(gamePlane)
            }
        }, update: {content, attachments in
            if let attachmentEntity = attachments.entity(for: "test") {
                print(content.entities)
                if let player = content.entities.first?.findEntity(named: "BottleCapPlayer") {
//                    content.add(attachmentEntity)
//                    attachmentEntity.move(to: .identity, relativeTo: player)
                }
            }
            
        }, attachments: {
            Attachment(id: "test") {
                Image(systemName: "arrow.down").resizable().aspectRatio(contentMode: .fit).scaleEffect(0.1).offset(y: -25)
            }
        }).gesture(shoot)
        
    }

}


#Preview {
    ImmersiveView()
        .previewLayout(.sizeThatFits)
}
