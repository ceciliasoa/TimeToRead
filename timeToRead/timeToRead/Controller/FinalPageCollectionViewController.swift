//
//  FinalPageCollectionViewController.swift
//  timeToRead
//
//  Created by Cecilia Soares on 17/08/20.
//  Copyright © 2020 Cecilia Soares. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class FinalPageCollectionViewController: UICollectionViewController, StartButtonDelegate, textFieldData, UISearchBarDelegate, UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print("oi")
    }
    
    @IBOutlet var finalPageCollection: UICollectionView!
    var isSearched = false
    var searchBar = UISearchBar()
    let searchController = UISearchController(searchResultsController: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        finalPageCollection.backgroundColor = .backgroundColor
        collectionView.contentInset.top = 100
        
        // Search
        //navigationController?.navigationItem.leftItemsSupplementBackButton = true
        //        navigationItem.rightBarButtonItem?.customView?.addSubview(view)
        navigationItem.searchController?.isActive = true
        //navigationItem.titleView = searchBar
        navigationItem.searchController = searchController
        searchController.searchBar.placeholder = "Qual livro você está lendo?"
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        
        
        
    }
    override func viewWillDisappear(_ animated: Bool) {
//        searchController.searchResultsUpdater =
        isSearched = true
        collectionView.reloadData()
    }
    
    override func loadView() {
        super.loadView()
        registerCell()
    }
    
    func registerCell() {
        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        finalPageCollection.register(UINib.init(nibName: NumPageCollectionViewCell.xibName, bundle: nil), forCellWithReuseIdentifier: NumPageCollectionViewCell.identifier)
        finalPageCollection.register(UINib.init(nibName: SearchBookCollectionViewCell.xibName, bundle: nil), forCellWithReuseIdentifier: SearchBookCollectionViewCell.identifier)
        finalPageCollection.register(UINib.init(nibName: PagesBookCollectionViewCell.xibName, bundle: nil), forCellWithReuseIdentifier: PagesBookCollectionViewCell.identifier)
        finalPageCollection.register(UINib.init(nibName: StartCollectionViewCell.xibName, bundle: nil), forCellWithReuseIdentifier: StartCollectionViewCell.identifier)
        finalPageCollection.register(UINib.init(nibName: ShowBookCollectionViewCell.xibName, bundle: nil), forCellWithReuseIdentifier: ShowBookCollectionViewCell.identifier)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searched = searchController.searchBar.text else{fatalError("error")}
        let searchReplace = searched.replacingOccurrences(of: " ", with: "+")
        print(searchReplace)
        ApiManager().booksApi(searchItens: searchReplace) { (result) in
            switch result {
            case .success(let book):
                print(book)
                guard let title = book[0].volumeInfo.title else {fatalError("error")}
                guard let page = book[0].volumeInfo.pageCount else {fatalError("Error")}
                guard let author = book[0].volumeInfo.authors[0] else {fatalError("Error")}

                print(page, title, author)
                Reading.shared.totalPage = page
                Reading.shared.bookTitle = title
                Reading.shared.bookAuthor = author
                self.isSearched = true
                
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
        collectionView.reloadData()

    }
    //    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    //
    //
    //        print(searchText)
    //    }
    
    func dataCell(text: String) {
        let pageInt = Int(text)
        Reading.shared.finalPage = pageInt
        //        Reading.shared.totalPage = 458
    }
    
    
    func start() {
        performSegue(withIdentifier: "ResultSegue", sender: self)
    }
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
            //        case 0:
            //
            //            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchBookCollectionViewCell.identifier, for: indexPath) as! SearchBookCollectionViewCell
        //            return cell
        case 0:
            
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NumPageCollectionViewCell.identifier, for: indexPath) as! NumPageCollectionViewCell
            cell.delegate = self
            cell.labelTitle.font = .systemFont(ofSize: 20, weight: .medium)
            return cell
            
        case 1:
            if isSearched == false{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PagesBookCollectionViewCell.identifier, for: indexPath) as! PagesBookCollectionViewCell
                cell.labelTitle.font = .systemFont(ofSize: 20, weight: .medium)
                return cell
            }else{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShowBookCollectionViewCell.identifier, for: indexPath) as! ShowBookCollectionViewCell
                cell.titleLabel.text = Reading.shared.bookTitle
                cell.authorLabel.text = Reading.shared.bookAuthor
                guard let page = Reading.shared.totalPage else {fatalError("error")}
                cell.pageLabel.text = "\(page) páginas"
                return cell
                
            }
        case 2:
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



