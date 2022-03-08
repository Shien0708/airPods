//
//  CustomizeViewController.swift
//  shellDecorating
//
//  Created by 方仕賢 on 2022/3/7.
//

import UIKit

var airpodsName = "airpod-9"
var airpodsProName = "airpodsPro-12"
var editedText = ""
var newFont = UIFont(name: "", size: 17)
var textSize: Float = 0
var editedTextColor = UIColor.black
var textColorIndex = 0
var colorIndex = 8
var proColorIndex = 11

class CustomizeViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var selectColorButton: UIButton!
    
    @IBOutlet weak var selectTextColorButton: UIButton!
    
    @IBOutlet weak var controlSizeSlider: UISlider!
    var colorActions = [UIAction]()
    var textColorActions = [UIAction]()
    var airpodsColors = ["Red", "Rose Red", "Orange", "Purple", "Yellow", "Pink", "Lime Green", "Light Purple", "White", "Light Grey", "Gray", "Olive Green", "Dark blue", "Black", "Rose"]
    var airpodsProColors = ["Black", "Adavance Ash", "Blue Grey", "Blue Horizon", "Coast Blue", "Pink Sand", "Nectraine", "Red", "Purple", "Mint Green", "Stone White", "White", "Watermelon Red", "Lemon Yellow", "Green","Greyish Green","Gray", "Pink", "Rose Red"]
    let textColors = [UIColor.black, UIColor.white, UIColor.red, UIColor.green, UIColor.blue, UIColor.brown, UIColor.cyan]
    let colorNames = ["Black", "White", "Red", "Green", "Blue", "Brown", "Cyan"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        selectColor()
        changeTextColor()
        textLabel.text = editedText
        selectTextColorButton.setTitle(colorNames[textColorIndex], for: .normal)
        
        if textLabel.text != "" {
            textLabel.font = newFont
            controlSizeSlider.value = textSize
            controlSizeSlider.isEnabled = true
            textLabel.textColor = editedTextColor
        } else {
            controlSizeSlider.isEnabled = false
        }
        
        if productIndex == 0 {
            productImageView.image = UIImage(named: airpodsName)
            selectColorButton.setTitle(airpodsColors[colorIndex], for: .normal)
        } else {
            productImageView.image = UIImage(named: airpodsProName)
            selectColorButton.setTitle(airpodsProColors[proColorIndex], for: .normal)
        }
        
    }
    
    func selectColor(){
        selectColorButton.showsMenuAsPrimaryAction = true
        
        colorActions.removeAll()
        
        if productIndex == 0 {
            for i in 0...airpodsColors.count-1 {
                colorActions.append(UIAction(title: airpodsColors[i], handler: { action in
                    self.productImageView.image = UIImage(named: "airpod-"+"\(i+1)")
                    airpodsName = "airpod-\(i+1)"
                    colorIndex = i
                    print(colorIndex)
                }))
            }
        } else if productIndex == 1 {
            for i in 0...airpodsColors.count-1 {
                colorActions.append(UIAction(title: airpodsProColors[i], handler: { action in
                    self.productImageView.image = UIImage(named: "airpodsPro-"+"\(i+1)")
                    airpodsProName = "airpodsPro-\(i+1)"
                    proColorIndex = i
                    print(proColorIndex)
                    
                }))
            }
        }
        selectColorButton.menu = UIMenu(children: colorActions)
    }
    
    func changeTextColor(){
        selectTextColorButton.showsMenuAsPrimaryAction = false
        
        for i in 0...textColors.count-1 {
            textColorActions.append(UIAction(title: colorNames[i], handler: { action in
                self.textLabel.textColor = self.textColors[i]
                editedTextColor = self.textColors[i]
                textColorIndex = i
            }))
        }
        
        selectTextColorButton.menu = UIMenu(children: textColorActions)
    }
    
    @IBAction func editText(_ sender: UITextField) {
        if inputTextField.text!.count > 6 {
            let alert = UIAlertController(title: "More than six letters!", message: "Please enter six or less letters", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            
        } else {
            textLabel.text! = inputTextField.text!
            editedText = inputTextField.text!
        }
        
        
        if textLabel.text == "" {
            controlSizeSlider.isEnabled = false
        } else {
            controlSizeSlider.isEnabled = true
        }
    }
    
    @IBAction func editFontSize(_ sender: UISlider) {
        
            view.endEditing(true)
            newFont = textLabel.font.withSize(CGFloat(sender.value))
            
            textLabel.font = newFont
            textSize = sender.value
        
    }
    
}

extension CustomizeViewController: UITextViewDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
