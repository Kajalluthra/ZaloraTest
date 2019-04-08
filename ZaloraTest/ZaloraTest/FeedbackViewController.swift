//
//  FeedbackViewController.swift
//  ZaloraTest
//
//  Created by Kajal on 8/4/19.
//  Copyright © 2019 Kajal. All rights reserved.
//

import Foundation
import UIKit

protocol FeedbackDelegate: class {
    func didUpdateListManager(value : [String])
}

class FeedbackViewController: UIViewController {
    
    @IBOutlet weak var feedTextView: UITextView!
    weak var delegate: FeedbackDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "done"), style: .plain, target: self, action: #selector(doneFeedback))
    }
    
    @objc func doneFeedback(_ sender: UIBarButtonItem) {
        
        delegate?.didUpdateListManager(value: ["hi"])
        self.navigationController?.popViewController(animated: true)
    }
}

extension FeedbackViewController : UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Enter text here..." {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Enter text here..."
            textView.textColor = UIColor.lightGray
        }
    }
}
