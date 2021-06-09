//
//  ViewController.swift
//  PokedexCascao
//
//  Created by Will Xavier on 02/06/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
      
    @IBOutlet weak var pokeTableView: UITableView!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: - UITableviewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.pokeTableView.dequeueReusableCell(withIdentifier: "pokeListCell") as? PokeSimpleTableViewCell else {
            return UITableViewCell()
        }
        
        cell.pokeName.text = "Section: \(indexPath.section) Row: \(indexPath.row)"
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

