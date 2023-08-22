//
//  NewsListViewViewModel.swift
//  News
//
//  Created by O'lmasbek on 23/08/23.
//

import Foundation
import UIKit

class NewsListViewViewModel: NSObject {
    
}
extension NewsListViewViewModel: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }    
}
