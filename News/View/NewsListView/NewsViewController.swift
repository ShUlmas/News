//
//  NewsViewController.swift
//  News
//
//  Created by O'lmasbek on 22/08/23.
//

import UIKit
import SafariServices

class NewsViewController: UIViewController {

    private var articles = [Article]()
    private var viewModels = [NewsTableViewCellViewModel]()
    
    private let tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .grouped)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.separatorStyle = .singleLine
        tv.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tv.backgroundColor = .systemBackground
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        configureTableView()
        fetchNews()
    }
    
    func fetchNews() {
        showLoadingView()
        APIManager.shared.getNews { result in
            switch result {
            case .success(let articles):
                self.articles = articles
                self.viewModels = articles.compactMap({ NewsTableViewCellViewModel(
                    title: $0.title,
                    description: $0.description ?? "No description",
                    imageUrl: URL(string: $0.urlToImage ?? "Bad url"))
                    
                })
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            self.dismissLoadingView()
        }
        
    }
    
    func setUpView() {
        view.backgroundColor = .systemBackground
        title = "News"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        
        
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.cellIdentifier)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
}
//MARK: - UITableViewDelegate
extension NewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = articles[indexPath.row]
        guard let url = URL(string: article.url ?? "") else { return }
        
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
}
//MARK: - UITableViewDataSource
extension NewsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.cellIdentifier, for: indexPath) as? NewsTableViewCell else { return UITableViewCell() }
        let viewModel = viewModels[indexPath.row]
        cell.configure(with: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height: CGFloat = 400
        return height
    }
    
}
