//
//  ViewController.swift
//  NavigationBar FadeAnimation
//
//  Created by jaspreet on 18/03/18.
//  Copyright © 2018 Shiju. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var collectionView: UICollectionView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    collectionView.delegate = self
    collectionView.dataSource = self
    
    self.navigationController?.navigationBar.tintColor = .white
    self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    self.navigationController?.navigationBar.shadowImage = UIImage()
   
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 9
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath)
    
    
    return cell
    
  }
  
  func collectionview(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndex: IndexPath) -> CGSize {
    
    return CGSize(width: collectionView.frame.size.width, height: 300)
    
  }
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    
    var offSet = scrollView.contentOffset.y / 150
    
    let updateNavColor = UIColor(red: 1, green: 1, blue: 1, alpha: offSet)
    
    if offSet > 1 {
      offSet = 1
      //Update Navigation Item Color
      self.navigationController?.navigationBar.tintColor = .red
      
    }else {
      
      self.navigationController?.navigationBar.tintColor = .white
      
    }
    
    //Update NavigationBar Background Color
    self.navigationController?.navigationBar.backgroundColor = updateNavColor
    
    UIApplication.shared.statusBarView?.backgroundColor = updateNavColor
    
    
  }
  
}

