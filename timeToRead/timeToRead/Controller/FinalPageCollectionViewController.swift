//
//  FinalPageCollectionViewController.swift
//  timeToRead
//
//  Created by Cecilia Soares on 17/08/20.
//  Copyright © 2020 Cecilia Soares. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class FinalPageCollectionViewController: UICollectionViewController, StartButtonDelegate {
    func start() {
        performSegue(withIdentifier: "ResultSegue", sender: self)
    }
    

    @IBOutlet var finalPageCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        finalPageCollection.backgroundColor = .backgroundColor
        collectionView.contentInset.top = 100
        


        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        finalPageCollection.register(UINib.init(nibName: NumPageCollectionViewCell.xibName, bundle: nil), forCellWithReuseIdentifier: NumPageCollectionViewCell.identifier)
        finalPageCollection.register(UINib.init(nibName: SearchBookCollectionViewCell.xibName, bundle: nil), forCellWithReuseIdentifier: SearchBookCollectionViewCell.identifier)
        finalPageCollection.register(UINib.init(nibName: PagesBookCollectionViewCell.xibName, bundle: nil), forCellWithReuseIdentifier: PagesBookCollectionViewCell.identifier)
        finalPageCollection.register(UINib.init(nibName: StartCollectionViewCell.xibName, bundle: nil), forCellWithReuseIdentifier: StartCollectionViewCell.identifier)

        // Do any additional setup after loading the view.
    }


    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchBookCollectionViewCell.identifier, for: indexPath) as! SearchBookCollectionViewCell
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NumPageCollectionViewCell.identifier, for: indexPath) as! NumPageCollectionViewCell
            
            cell.labelTitle.font = .systemFont(ofSize: 20, weight: .medium)
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PagesBookCollectionViewCell.identifier, for: indexPath) as! PagesBookCollectionViewCell
            cell.labelTitle.font = .systemFont(ofSize: 20, weight: .medium)
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StartCollectionViewCell.identifier, for: indexPath) as! StartCollectionViewCell
            cell.delegate = self
            cell.startButton.setTitle("Resultado", for: .normal)
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
            return cell
        }
    }


}

    
