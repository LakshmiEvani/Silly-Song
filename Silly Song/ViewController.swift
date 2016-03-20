//
//  ViewController.swift
//  Silly Song
//
//  Created by Souji on 1/16/16.
//  Copyright © 2016 Souji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var nameField: UITextField!
    
    
    @IBOutlet weak var lyricsView: UITextView!
    
    var bananaFanaTemplate:String = ""
    
    var fullName: String = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameField.delegate = self
                
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  // reset function
    
    @IBAction func reset(sender: AnyObject) {
        nameField.text = ""
        lyricsView.text = ""
  
    }
    
    //Display lyrics function
    
    @IBAction func displayLyrics(sender: AnyObject) {
        
      
        if let name = (nameField.text)?.capitalizedString {
            
            if name .isEmpty {
                
                lyricsView.text = "Please enter Name"
                
            } else {
                
                lyricsView.text = lyricsForName(lyricsTemplate, fullName: name)
            }
        }
        
        
    }


}

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}



//ShortName function

func shortNameFromName(fullname: String) -> String {
    
    let vowelSet = NSCharacterSet(charactersInString: "aeiou")
    
    let shortName: String = fullname.lowercaseString
    
    
    if let firstVowelRange = shortName.stringByFoldingWithOptions(.DiacriticInsensitiveSearch, locale: nil).rangeOfCharacterFromSet(vowelSet) {
        
        return shortName.substringFromIndex(firstVowelRange.startIndex)
    }


    
    return shortName
    
}

// Template
let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joinWithSeparator("\n")

let lyricsTemplate = bananaFanaTemplate


//lyricsForName function
func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    
    
    let fullnameReplace = bananaFanaTemplate.stringByReplacingOccurrencesOfString("<FULL_NAME>", withString: fullName)

    
    let shortnameReplace = fullnameReplace.stringByReplacingOccurrencesOfString("<SHORT_NAME>", withString: shortNameFromName(fullName))

    return shortnameReplace
}
