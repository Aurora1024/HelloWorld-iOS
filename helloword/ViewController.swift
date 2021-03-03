//
//  ViewController.swift
//  helloword
//
//  Created by 吴可菲 on 2/24/21.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet
    var tableView: UITableView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var items: [String] = ["Hello world!", "Hello world!", "Hello world!" , "Hello world!", "Hello world!", "Hello world!"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        tableView.delegate = self
        tableView.dataSource = self
        
        setUpCollectionView()
        
    }
    
    func setUpCollectionView() {

            let collectionFlowLayout = UICollectionViewFlowLayout()

            collectionFlowLayout.scrollDirection = .horizontal
            collectionFlowLayout.itemSize = CGSize(width: 145, height: 145)
            collectionView.setCollectionViewLayout(collectionFlowLayout, animated: true)
            collectionView.delegate = self
            collectionView.dataSource = self
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you tapped me!")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 6
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
              
        //cell.textLabel!.text = "Hello world"
        cell.textLabel?.text = self.items[indexPath.row]
        
        return cell
    }
    
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        

        let title = UILabel(frame: CGRect(x: 0, y: 0, width: cell.bounds.size.width, height: 50))
        title.text = "Hello World!"
        title.font = UIFont(name: "AvenirNext-Bold", size: 15)
        title.textAlignment = .center
        cell.contentView.addSubview(title)
        return cell
        
    }
    
}


