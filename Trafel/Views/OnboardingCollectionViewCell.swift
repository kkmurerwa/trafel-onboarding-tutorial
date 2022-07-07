//
//  OnboardingCollectionViewCell.swift
//  Trafel
//
//  Created by Kenneth Murerwa on 05/07/2022.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var sliderImageView: UIImageView!
    
    func configure(image: UIImage) {
        sliderImageView.image = image
    }
}
