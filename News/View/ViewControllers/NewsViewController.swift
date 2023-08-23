//
//  NewsViewController.swift
//  News
//
//  Created by O'lmasbek on 22/08/23.
//

import UIKit

class NewsViewController: UIViewController {

    private let listView = NewsListView()
    private let listViewViewModel = NewsListViewViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setUpLayout()
        listViewViewModel.fetchArticles()
    }
    
    func setUpView() {
        view.backgroundColor = .systemBackground
        title = "News"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
    }
    
    private func setUpLayout() {
        view.addSubview(listView)
        
        NSLayoutConstraint.activate([
            listView.topAnchor.constraint(equalTo: view.topAnchor),
            listView.leftAnchor.constraint(equalTo: view.leftAnchor),
            listView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            listView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
}
