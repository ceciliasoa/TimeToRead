//
//  RunnigCollectionViewController.swift
//  timeToRead
//
//  Created by Cecilia Soares on 16/08/20.
//  Copyright © 2020 Cecilia Soares. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class RunnigCollectionViewController: UICollectionViewController {
    @IBOutlet var runningCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        runningCollection.backgroundColor = .backgroundColor
        collectionView.contentInset.top = 200
        
         self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.textColor, .font: UIFont.systemFont(ofSize: 35, weight: .bold)]


        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        runningCollection.register(UINib(nibName: TimeCollectionViewCell.xibName, bundle: nil), forCellWithReuseIdentifier: TimeCollectionViewCell.identifier)
        runningCollection.register(UINib.init(nibName: StopCollectionViewCell.xibName, bundle: nil), forCellWithReuseIdentifier: StopCollectionViewCell.identifier)
//        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 30)
//        layout.minimumInteritemSpacing = 10
//        layout.minimumLineSpacing = 0
//        collectionView!.collectionViewLayout = layout

    }



    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TimeCollectionViewCell.identifier, for: indexPath) as! TimeCollectionViewCell
                    return cell

            }else{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StopCollectionViewCell.identifier, for: indexPath) as! StopCollectionViewCell
//                cell.startButton.setTitle("Avançar", for: .normal)
                return cell
            }

        }
    }

    
