//
//  Slide.swift
//  Trafel
//
//  Created by Kenneth Murerwa on 05/07/2022.
//

import Foundation
import UIKit

struct Slide {
    
    var title: String
    var description: String
    var imageName: String
    
    static let collection: [Slide] = [
        Slide(title: "Why use Trafel?", description: "Trafel allows you to travel around the world, make new friends and create memorable experiences", imageName: "imgslide4"),
        Slide(title: "Connect Socially", description: "Connect across continents to strangers via the app", imageName: "imgslide2"),
        Slide(title: "Safe and secure", description: "Each trip is planned according to the strictest safety standards to ensure passenger safety", imageName: "imgslide3")
    ]
    
}
