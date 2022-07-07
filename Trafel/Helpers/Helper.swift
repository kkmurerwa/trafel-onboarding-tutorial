//
//  File.swift
//  Trafel
//
//  Created by Kenneth Murerwa on 05/07/2022.
//

import Foundation

func delay(durationInSeconds: Double, completion: @escaping () -> Void) {
    
    DispatchQueue.main.asyncAfter(deadline: .now() + durationInSeconds, execute: completion)
    
}
