//
//  ViewController.swift
//  shellDecorating
//
//  Created by 方仕賢 on 2022/3/7.
//

import UIKit

var productIndex = 0

class ViewController: UIViewController {
    @IBOutlet weak var productImageView: UIImageView!
    
    @IBOutlet weak var editedLabel : UILabel!
    @IBOutlet weak var versionSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func chooseVersion(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            productImageView.image = UIImage(named: airpodsName)
            productIndex = 0
        } else if sender.selectedSegmentIndex == 1 {
            productImageView.image = UIImage(named: airpodsProName)
            productIndex = 1
        }
    }
    
    @IBAction func completeEditing(segue: UIStoryboardSegue) {
        chooseVersion(versionSegmentedControl)
        editedLabel.text = editedText
        editedLabel.font = newFont
        editedLabel.textColor = editedTextColor
    }
}

