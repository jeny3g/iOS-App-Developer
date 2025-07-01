//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var calculatorBrain = BillCalculator();
    
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        let tip = sender.currentTitle!
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        billTextField.endEditing(true)
        calculatorBrain.updateTipPercentage(from: tip)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let peopleTotal = Int(sender.value)
        
        splitNumberLabel.text = String(peopleTotal)
        calculatorBrain.updateSplitBetween(peopleTotal)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        guard let costText = billTextField.text?.replacingOccurrences(of: ",", with: ".") else { return }

        let costValue = Float(costText) ?? 0.0
        calculatorBrain.updateTotalAmount(costValue)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
        
            let bill = calculatorBrain.getBillDetails()
            
            destinationVC.totalValue = String(format: "%.2f", calculatorBrain.getAmountPerPerson())
            destinationVC.settingsText = "Split between \(bill.splitBetween), with \(bill.tipPercentage) tip."
        }
    }
}

