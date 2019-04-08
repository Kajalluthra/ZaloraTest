//
//  ViewController.swift
//  ZaloraTest
//
//  Created by Kajal on 8/4/19.
//  Copyright © 2019 Kajal. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!
    var feedbackArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "edit"), style: .plain, target: self, action: #selector(composeFeedback))
        homeTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    @objc func composeFeedback(sender: UIBarButtonItem) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "FeedbackViewController") as! FeedbackViewController
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedbackArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = feedbackArray[indexPath.row]
        return cell
    }
}

extension HomeViewController: FeedbackDelegate {
    
    func didUpdateListManager(value: [String]) {
        feedbackArray = value
        homeTableView.reloadData()
    }
}
