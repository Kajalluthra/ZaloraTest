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
    
    //MARK:- App LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "done"), style: .plain, target: self, action: #selector(doneFeedback))
    }
    
    @objc func doneFeedback(_ sender: UIBarButtonItem) {
        
        guard let message = feedTextView.text else {
            return
        }

        let result = splitFeedback(message, length: GlobalConstants.Limit)
        if !result.isEmpty {
            delegate?.didUpdateListManager(value: result)
            self.navigationController?.popViewController(animated: true)
        }
    }
}

//MARK:- UITextViewDelegate
extension FeedbackViewController : UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == GlobalConstants.EnterText {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = GlobalConstants.EnterText
            textView.textColor = UIColor.lightGray
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
}

//MARK:- Business logic
extension FeedbackViewController {
    
    func splitFeedback(_ text: String, length: Int) -> [String] {
        
        if validate(text){
            showAlertPopUp(message: GlobalConstants.EmptyError)
            return []
        } else if text.count < GlobalConstants.Limit  {
            let removeWhiteSpace = text.trimmingCharacters(in: .whitespaces)
            return [removeWhiteSpace]
            
        } else if text.count > GlobalConstants.Limit && !checkWhiteSpace(text) {
            
            let seperator = " "
            var result = [String]()
            var collectedWords = [String]()
            var count = 0
            let message = text.trimmingCharacters(in: .whitespaces)
            if !message.contains(" ") && message.count > GlobalConstants.Limit {
                showAlertPopUp(message: GlobalConstants.WhiteSpaceError)
                return []
            }
            
            collectedWords.reserveCapacity(length)
            let words = message.components(separatedBy: " ")
            
            for word in words {
                count += word.count + 1 // Add 1 for space
                if (count > length) {   // Reached the desired length
                    
                    result.append(collectedWords.map { String($0) }.joined(separator: seperator) )
                    collectedWords.removeAll(keepingCapacity: true)
                    count = word.count
                    collectedWords.append(word)
                    
                } else {
                    collectedWords.append(word)
                }
            }
            
            if !collectedWords.isEmpty { // Append the remainder
                result.append(collectedWords.map { String($0) }.joined(separator: seperator))
            }
            
            var feedbackArray = [String]() // Add 1/2 such cases
            for (index, element) in result.enumerated() {
                let number = index
                feedbackArray.append("\(number+1)/\(result.count) \(element)")
            }
            
            return feedbackArray
        }
        else {
            return []
        }
    }
    
    func checkWhiteSpace(_ value: String) -> Bool {
        let whitespace =  value.trimmingCharacters(in: .whitespaces)
        return whitespace.isEmpty ? true : false
    }
    
    func validate(_ message: String) -> Bool {
        let filteredmsg = message.replacingOccurrences(of: " ", with: "")
        if message.contains(GlobalConstants.EnterText) || filteredmsg.isEmpty || filteredmsg == "\n" {
            return true
        }
        return false
    }
}

