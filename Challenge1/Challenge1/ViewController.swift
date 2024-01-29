//
//  ViewController.swift
//  Challenge1
//
//  Created by Muhammad Adha Fajri Jonison on 29/01/24.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasSuffix(".png") {
                pictures.append(item)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pictures.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        
        let picture = pictures[indexPath.row]
        
        cell.textLabel?.text = picture.replacingOccurrences(of: ".png", with: "")
        cell.imageView?.image = UIImage(named: picture)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController else {
            return
        }
        
        let selectedRow = tableView.cellForRow(at: indexPath)
        
        let name = selectedRow?.textLabel?.text
        let image = selectedRow?.imageView?.image
        vc.name = name
        vc.image = image
        navigationController?.pushViewController(vc, animated: true)
    }
}

