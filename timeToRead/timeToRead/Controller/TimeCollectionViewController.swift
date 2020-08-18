//
//  TimeCollectionViewController.swift
//  timeToRead
//
//  Created by Cecilia Soares on 14/08/20.
//  Copyright © 2020 Cecilia Soares. All rights reserved.
//

import UIKit

class TimeCollectionViewController: UICollectionViewController, CustomDelegate {
    
    func start() {
        navigationController?.pushViewController(CurrentPageCollectionViewController(), animated: true)
       // performSegue(withIdentifier: "CurrentPageSegue", sender: self)

    }
    
    @IBOutlet var timeFirstScreen: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeFirstScreen.backgroundColor = .backgroundColor
        collectionView.contentInset.top = 200
       
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.textColor, .font: UIFont.systemFont(ofSize: 35, weight: .bold)]
        // Register cell classes
        timeFirstScreen.register(UINib(nibName: TimeCollectionViewCell.xibName, bundle: nil), forCellWithReuseIdentifier: TimeCollectionViewCell.identifier)
        timeFirstScreen.register(UINib.init(nibName: StartCollectionViewCell.xibName, bundle: nil), forCellWithReuseIdentifier: StartCollectionViewCell.identifier)
        timeFirstScreen.register(UINib.init(nibName: NumPageCollectionViewCell.xibName, bundle: nil), forCellWithReuseIdentifier: NumPageCollectionViewCell.identifier)
        timeFirstScreen.delegate = self
       
        
        

    }
//    @objc
//    func start(_ sender: Any) {
//               self.performSegue(withIdentifier: "CurrentPageSegue", sender: self)
//           }
    
   

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
        
    }
    


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TimeCollectionViewCell.identifier, for: indexPath) as! TimeCollectionViewCell
            return cell
        } else{
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StartCollectionViewCell.identifier, for: indexPath) as! StartCollectionViewCell
            cell.delegate = self
//            cell.startButton.addTarget(self, action: #selector(start(_ :)), for: .touchUpInside)

            return cell
        }
        
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
