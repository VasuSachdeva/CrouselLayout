//
//  Hobbies.swift
//  CrouselLayout
//
//  Created by MAC on 12/03/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import UIKit

class Hobbies
{
	var title = ""
	var featuredImage: UIImage
	init(title: String,featuredImage: UIImage) {
		self.title = title
		self.featuredImage = featuredImage
		
	}
	static func fetchHobbies() -> [Hobbies]
	{
		return[
			Hobbies(title: "Travelling Around the World",featuredImage: UIImage(named: "2")!),Hobbies(title: "Cafe With BestFriends", featuredImage: UIImage(named: "3")!),Hobbies(title: "Playing Cricket and FootBall",featuredImage: UIImage(named: "4")!),Hobbies(title: "Travelling And Hanging Out With Friends",featuredImage: UIImage(named: "5")!),Hobbies(title: "Reading Books And Novels",featuredImage: UIImage(named: "6")!),Hobbies(title: "Doing Research And Coding ",featuredImage: UIImage(named: "7")!)]
	}
	
}
