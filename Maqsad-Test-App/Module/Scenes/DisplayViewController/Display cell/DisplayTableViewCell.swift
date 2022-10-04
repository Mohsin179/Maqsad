//
//  DisplayTableViewCell.swift
//  Maqsad-Test-App
//
//  Created by Mohsin Hassan on 04/10/2022.
//

import UIKit

class DisplayTableViewCell: UITableViewCell {
    
    static let id: String = "DisplayTableViewCell"
    static let nib: UINib = UINib(nibName: "DisplayTableViewCell", bundle: nil)

    @IBOutlet weak var imgView: UIImageViewX!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        prepareView()
    }

    func bindData(data: Items?) {
        guard let data = data else {
            return
        }
        lblTitle.text = data.login ?? ""
        lblDescription.text = data.type ?? ""
        downloadImage(from: data.avatar_url ?? "")
        prepareView()
    }
    
    func downloadImage(from urlString: String) {
        print("Download Started")
        guard let url = URL.init(string: urlString) else {
            return
        }
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            // always update the UI from the main thread
            DispatchQueue.main.async() { [weak self] in
                self?.imgView.image = UIImage(data: data)
            }
        }
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
}


extension DisplayTableViewCell {
   func prepareView() {
    }
}
