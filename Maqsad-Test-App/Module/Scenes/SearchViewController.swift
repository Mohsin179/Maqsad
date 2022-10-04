//
//  SearchViewController.swift
//  Maqsad-Test-App
//
//  Created by Mohsin Hassan on 04/10/2022.
//

import UIKit


class SearchViewController: UIViewController {
    
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var uiView: UIView!
    @IBOutlet weak var tfSearch: UITextField!
    @IBOutlet weak var btnSearch: UIButton!
    
    var viewModel: SearchViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareViewModel()
        prepareView()
    }
    
    @IBAction func didTapSearch(_ sender: Any) {
        viewModel?.getRequest(text: tfSearch.text ?? "")
    }
    
    func prepareViewModel() {
        self.viewModel = SearchViewModel.init(controller: self)
    }
    
}

extension SearchViewController {
    func prepareView() {
        Utilities.styleView(uiView)
        view2.layer.cornerRadius = 50
        view2.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
}

extension SearchViewController: SearchViewModelDelegate {
    func dataFetchSuccessfully(from: SearchViewModel, data: [Items]) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "DisplayViewController") as! DisplayViewController
        secondViewController.data = data
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(secondViewController, animated: true)
        }
        
//        let sb = UIStoryboard(name: "Main", bundle: nil)
//        let vc = sb.instantiateViewController(identifier: "DisplayViewController") as! DisplayViewController
//        self.navigationController?.pushViewController(self, animated: true)

    }
}

