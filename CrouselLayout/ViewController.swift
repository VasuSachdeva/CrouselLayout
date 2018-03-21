//
//  ViewController.swift
//  CrouselLayout
//
//  Created by MAC on 12/03/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var hobbiesCollectionView: UICollectionView!
	
	let cellScaling: CGFloat = 0.65
	var hobbies = Hobbies.fetchHobbies()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		let screenSize = UIScreen.main.bounds.size
		let cellWidth = floor(screenSize.width * cellScaling)
		let cellHeight = floor(screenSize.height * cellScaling)
		
		let insetX = (view.bounds.width - cellWidth) / 2.0
		let insetY = (view.bounds.height - cellHeight) / 2.0
		
		let layout = hobbiesCollectionView!.collectionViewLayout as! UICollectionViewFlowLayout
		layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
		hobbiesCollectionView?.contentInset = UIEdgeInsets(top: insetY, left: insetX, bottom: insetY, right: insetX)
		
		hobbiesCollectionView?.dataSource = self
		hobbiesCollectionView?.delegate = self
		// Do any additional setup after loading the view, typically from a nib.
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	
	
	
}
extension ViewController : UICollectionViewDataSource
{
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return hobbies.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
	{
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "hobbiesCell", for: indexPath) as! HobbiesCollectionViewCell
		cell.hobbies =  hobbies[indexPath.item]
		
		return cell
	}
}

extension ViewController: UIScrollViewDelegate, UICollectionViewDelegate
{
	func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>)
	{
		let layout = self.hobbiesCollectionView?.collectionViewLayout as! UICollectionViewFlowLayout
		let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
		
		var offset = targetContentOffset.pointee
		let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
		let roundedIndex = round(index)
		
		offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
		targetContentOffset.pointee = offset
	}
}



