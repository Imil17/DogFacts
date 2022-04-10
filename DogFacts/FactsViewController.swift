//
//  FactsViewController.swift
//  DogFacts
//
//  Created by Эмиль on 10.04.2022.
//

import UIKit

class FactsViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.fetchFacts()
        
        // принт, для проверки заполнения массива
        print(NetworkManager.shared.facts.count)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NetworkManager.shared.facts.count
        
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        return cell
    }
}

