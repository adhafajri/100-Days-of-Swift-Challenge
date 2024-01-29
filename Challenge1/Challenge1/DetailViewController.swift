//
//  DetailViewController.swift
//  Challenge1
//
//  Created by Muhammad Adha Fajri Jonison on 29/01/24.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var name: String?
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = name
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        imageView.image = image
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
         super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc private func shareTapped() {
        guard let name = name, let image = image?.jpegData(compressionQuality: 0.8) else { return }
        
        let ac = UIActivityViewController(activityItems: [name, image], applicationActivities: [])
        ac.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(ac, animated: true)
    }
}
