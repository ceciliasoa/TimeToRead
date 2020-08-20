//
//  CurrentPageCollectionViewController.swift
//  timeToRead
//
//  Created by Cecilia Soares on 14/08/20.
//  Copyright © 2020 Cecilia Soares. All rights reserved.
//

import UIKit


class CurrentPageCollectionViewController: UICollectionViewController, StartButtonDelegate, textFieldData {
    func dataCell(text: String) {
        FinalPageModel.init(finalPage: nil , initialPage: text, totalPage: nil)
    }
    
    @IBOutlet var currentPageCollection: UICollectionView!
    
    
    func start() {
       //navigationController?.pushViewController(CurrentPageCollectionViewController(), animated: true)
       performSegue(withIdentifier: "RunningTimeSegue", sender: self)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        configTapGesture()
        currentPageCollection.backgroundColor = .backgroundColor
        collectionView.contentInset.top = 200
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.textColor, .font: UIFont.systemFont(ofSize: 35, weight: .bold)]
        

    }
    override func loadView() {
        super.loadView()
        registerCell()
    }
    
    func registerCell (){
        // Register cell classes
        currentPageCollection.register(UINib.init(nibName: NumPageCollectionViewCell.xibName, bundle: nil), forCellWithReuseIdentifier: NumPageCollectionViewCell.identifier)
        currentPageCollection.register(UINib.init(nibName: StartCollectionViewCell.xibName, bundle: nil), forCellWithReuseIdentifier: StartCollectionViewCell.identifier)
    }
    
    // Finish keyboard
//    func configTapGesture(){
//        let tapGesture = UIGestureRecognizer(target: self, action: #selector(CurrentPageCollectionViewController.handleTap))
//        view.addGestureRecognizer(tapGesture)
//    }
//    @objc func handleTap(){
//
//        view.endEditing(true)
//    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NumPageCollectionViewCell.identifier, for: indexPath) as! NumPageCollectionViewCell
            
            return cell

        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StartCollectionViewCell.identifier, for: indexPath) as! StartCollectionViewCell
            cell.delegate = self
            cell.startButton.setTitle("Avançar", for: .normal)
            return cell
        }

    }

}
