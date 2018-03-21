//
//  HobbiesCollectionViewCell.swift
//  CrouselLayout
//
//  Created by MAC on 12/03/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import UIKit

class HobbiesCollectionViewCell: UICollectionViewCell {
    
	@IBOutlet weak var featuredImageView: UIImageView!
	@IBOutlet weak var hobbiesLabel: UILabel!
	@IBOutlet weak var hobbiesBackgroundView: UIView!
	var hobbies : Hobbies?{
		didSet{
			self.updateUI()
		}
	}
 private func updateUI()
	{
		if let hobbie = hobbies{
			featuredImageView.image = hobbie.featuredImage
			hobbiesLabel.text = hobbie.title
		
			
		}
		else{
			featuredImageView.image = nil
			hobbiesLabel.text = nil
		}
	}
	override func layoutSubviews() {
		super.layoutSubviews()
		
		self.layer.cornerRadius = 10
		layer.shadowRadius = 5
		layer.shadowOpacity = 0.5
		layer.shadowOffset = CGSize(width: 5,height: 10)
		self.clipsToBounds = false
	}
}
