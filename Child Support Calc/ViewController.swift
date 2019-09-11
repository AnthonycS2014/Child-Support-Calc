//
//  ViewController.swift
//  Child Support Calc
//
//  Created by Anthony Shorter on 3/2/18.
//  Copyright © 2018 Anthony Shorter. All rights reserved.
//

import UIKit

extension UIView {
    func addBottomBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: frame.size.width, height: width)
        self.layer.addSublayer(border)
    }
 
    func addTopBorderWithColor(color: UIColor, width: CGFloat) {
            let border = CALayer()
            border.backgroundColor = color.cgColor
            border.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: width)
            self.layer.addSublayer(border)
        }
    
    func addLeftBorderWithColor(color: UIColor, width: CGFloat) {
            let border = CALayer()
            border.backgroundColor = color.cgColor
            border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
            self.layer.addSublayer(border)
        }

    func addDashedBorder(strokeColor: UIColor, lineWidth: CGFloat) {
            self.layoutIfNeeded()
            let strokeColor = strokeColor.cgColor
            
            let shapeLayer:CAShapeLayer = CAShapeLayer()
            let frameSize = self.frame.size
            let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)
            
            shapeLayer.bounds = shapeRect
            shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
            shapeLayer.fillColor = UIColor.clear.cgColor
            shapeLayer.strokeColor = strokeColor
            shapeLayer.lineWidth = lineWidth
            shapeLayer.lineJoin = CAShapeLayerLineJoin.round
            
            shapeLayer.lineDashPattern = [5,5] // adjust to your liking
            shapeLayer.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: shapeRect.width, height: shapeRect.height), cornerRadius: self.layer.cornerRadius).cgPath
            
            self.layer.addSublayer(shapeLayer)
        }

}
// Controller
class ViewController: UIViewController, UITextFieldDelegate {

    
    // View from the storyboard - labels
    @IBAction func annualCalc(_ sender: Any) {
        let firstValue = Double(annualGrossInc.text!)
        let outputValue = Double(firstValue!)
        let n = Double(outputValue) as NSNumber
        let months = Double(12)
        let n1 = Double(truncating: n)
        let gross1 = n1/months
        let yeargross = gross1 as NSNumber
        let formatter =  NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.currency
        
        let grossyr = formatter.string(from: (yeargross))
        annualLabel.text = "\((grossyr) ?? "nil")"
        
        
    }
    
    @IBAction func monthCalc(_ sender: Any) {
        let secondValue = Double(monthlyGrossInc.text!)
        let output2Value = Double(secondValue!)
        let n2 = (output2Value) as NSNumber
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.currency
        let gross2 = formatter.string(from: n2)
        monthGrossLabel.text = "\((gross2) ?? "nil")"
    }

    @IBAction func hourlyCalc(_ sender: Any) {
        let thirdValue = Double(hourlyIncRate.text!)
        let output3Value = Double(thirdValue!)
        let n3 = Double(output3Value)
        print(n3)
        let hours = Double(40)
        let ratepay = Double(4.333)
        let hrgross = (n3 * hours)
        let n4 = Double(hrgross)
        let n5 = Double(ratepay)
        print(n4)
        print(n5)
        let gross3 = (n4 * n5)
        
        let hourgross = gross3 as NSNumber
        let formatter =  NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.currency
        let grosshourlyrate = formatter.string(from: (hourgross))
        hourlyLabel.text = "\((grosshourlyrate) ?? "nil")"
        
      
    }
    
    
    @IBAction func otherIncome(_ sender: Any) {
        
        
    }
    
    @IBAction func incDeductions(_ sender: Any) {
        
        
    }
    
    
    
    @IBOutlet weak var depChild: UILabel!
    @IBOutlet weak var numOthChildren: UILabel!
    @IBOutlet weak var netResources: UILabel!
    @IBOutlet weak var percentCSAmount: UILabel!
    
    
    @IBOutlet weak var annualLabel: UILabel!
    @IBOutlet weak var monthGrossLabel: UILabel!
    @IBOutlet weak var hourlyLabel: UILabel!
    @IBOutlet weak var childLabel: UILabel!
    @IBOutlet weak var childOthLabel: UILabel!
    @IBOutlet weak var netResourceLabel: UILabel!
    @IBOutlet weak var incLabel: UILabel!
    @IBOutlet weak var othIncLabel: UILabel!
    @IBOutlet weak var pertCSLabel: UILabel!
    @IBOutlet weak var numChildren: UITextField!
    @IBOutlet weak var othChildren: UITextField!
    @IBOutlet weak var annualGrossInc: UITextField!
    @IBOutlet weak var monthlyGrossInc: UITextField!
    @IBOutlet weak var hourlyIncRate: UITextField!
    
    
    
    @IBOutlet weak var arrowLabel: UITextField!
   
    @IBOutlet weak var otherIncomeAmt: UITextField!
    
    @IBOutlet weak var deductIncome: UITextField!
    
    @IBOutlet weak var supportPercentage: UITextField!
    
    // Controller continued
    override func viewDidLoad() {
        
        super.viewDidLoad()
    
   //     numChildren.isUserInteractionEnabled = true
        
    //--- add UIToolBar on keyboard and Done button on UIToolBar ---//
        self.addDoneButtonOnKeyboard()
        
    // set keyboard to numberpad
    
        self.numChildren.keyboardType = UIKeyboardType.decimalPad
        self.annualGrossInc.keyboardType = UIKeyboardType.decimalPad
        self.hourlyIncRate.keyboardType = UIKeyboardType.decimalPad
        self.monthlyGrossInc.keyboardType = UIKeyboardType.decimalPad
        self.othChildren.keyboardType = UIKeyboardType.decimalPad
        self.otherIncomeAmt.keyboardType = UIKeyboardType.decimalPad



        netResources.addTopBorderWithColor(color: UIColor.gray, width: 1)
        netResources.addBottomBorderWithColor(color: UIColor.gray, width: 1)
        percentCSAmount.addTopBorderWithColor(color: UIColor.gray, width: 1)
        percentCSAmount.addBottomBorderWithColor(color: UIColor.gray, width: 1)
        
    var annualLabel: UIView!
        
        annualLabel = UIView()
        annualLabel.layer.cornerRadius = 5.0
        
        view.addSubview(annualLabel)
        
        annualLabel.translatesAutoresizingMaskIntoConstraints = false
        annualLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        annualLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        annualLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        annualLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    var monthGrossLabel: UIView!
        
        monthGrossLabel = UIView()
        monthGrossLabel.layer.cornerRadius = 5.0
        
        view.addSubview(monthGrossLabel)
        
        monthGrossLabel.translatesAutoresizingMaskIntoConstraints = false
        monthGrossLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        monthGrossLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        monthGrossLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        monthGrossLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    var hourlyLabel: UIView!
        
        hourlyLabel = UIView()
        hourlyLabel.layer.cornerRadius = 5.0
        
        view.addSubview(hourlyLabel)
        
        hourlyLabel.translatesAutoresizingMaskIntoConstraints = false
        hourlyLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        hourlyLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        hourlyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        hourlyLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    var childLabel: UIView!
        
        childLabel = UIView()
        childLabel.layer.cornerRadius = 5.0
        
        view.addSubview(childLabel)
        
        childLabel.translatesAutoresizingMaskIntoConstraints = false
        childLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        childLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        childLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        childLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    var childOthLabel: UIView!
        
        childOthLabel = UIView()
        childOthLabel.layer.cornerRadius = 5.0
        
        view.addSubview(childOthLabel)
        
        childOthLabel.translatesAutoresizingMaskIntoConstraints = false
        childOthLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        childOthLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        childOthLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        childOthLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    var netResourceLabel: UIView!
        
        netResourceLabel = UIView()
        netResourceLabel.layer.cornerRadius = 5.0
        
        view.addSubview(netResourceLabel)
        
        netResourceLabel.translatesAutoresizingMaskIntoConstraints = false
        netResourceLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        netResourceLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        netResourceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        netResourceLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    var incLabel: UIView!
        
        incLabel = UIView()
        incLabel.layer.cornerRadius = 5.0
        
        view.addSubview(incLabel)
        
        incLabel.translatesAutoresizingMaskIntoConstraints = false
        incLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        incLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        incLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        incLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    var othIncLabel: UIView!
        
        othIncLabel = UIView()
        othIncLabel.layer.cornerRadius = 5.0
        
        view.addSubview(othIncLabel)
        
        othIncLabel.translatesAutoresizingMaskIntoConstraints = false
        othIncLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        othIncLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        othIncLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        othIncLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    var pertCSLabel: UIView!
        
        pertCSLabel = UIView()
        pertCSLabel.layer.cornerRadius = 5.0
        
        view.addSubview(pertCSLabel)
        
        pertCSLabel.translatesAutoresizingMaskIntoConstraints = false
        pertCSLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        pertCSLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        pertCSLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pertCSLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
}
    override func viewDidLayoutSubviews() {
        annualLabel.addDashedBorder(strokeColor: UIColor.black, lineWidth: 1.0)
        monthGrossLabel.addDashedBorder(strokeColor: UIColor.black, lineWidth: 1.0)
        hourlyLabel.addDashedBorder(strokeColor: UIColor.black, lineWidth: 1.0)
        childLabel.addDashedBorder(strokeColor: UIColor.black, lineWidth: 1.0)
        childOthLabel.addDashedBorder(strokeColor: UIColor.black, lineWidth: 1.0)
        netResourceLabel.addDashedBorder(strokeColor: UIColor.black, lineWidth: 1.0)
        incLabel.addDashedBorder(strokeColor: UIColor.black, lineWidth: 1.0)
        othIncLabel.addDashedBorder(strokeColor: UIColor.black, lineWidth: 1.0)
        pertCSLabel.addDashedBorder(strokeColor: UIColor.black, lineWidth: 1.0)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func addDoneButtonOnKeyboard()
    {
        let doneToolbar: UIToolbar = UIToolbar()
        doneToolbar.barStyle = UIBarStyle.default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.doneClicked))
        
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(done)
        
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.annualGrossInc.inputAccessoryView = doneToolbar
        self.monthlyGrossInc.inputAccessoryView = doneToolbar
        self.hourlyIncRate.inputAccessoryView = doneToolbar
        self.numChildren.inputAccessoryView = doneToolbar
        self.othChildren.inputAccessoryView = doneToolbar
        self.otherIncomeAmt.inputAccessoryView = doneToolbar
        self.deductIncome.inputAccessoryView = doneToolbar
    }
    
    @objc func doneClicked()
   
    {
         view.endEditing(true)
        
    }
    
    
    func textField(_ textFieldToChange: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // limit to 6 characters
        let characterCountLimit = 6
    
        
        // We need to figure out how many characters would be in the string after the change happens
        let startingLength = textFieldToChange.text?.count ?? 0
        let lengthToAdd = string.count
        let lengthToReplace = range.length
        
        let newLength = startingLength + lengthToAdd - lengthToReplace
        
        return newLength <= characterCountLimit
    }
    
}

