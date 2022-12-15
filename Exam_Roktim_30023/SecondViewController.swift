//
//  SecondViewController.swift
//  Exam_Roktim_30023
//
//  Created by Bjit on 14/12/22.
//

import UIKit

class SecondViewController: UIViewController {
    var delegate: ViewController?
    var indexPath: IndexPath?
    
    @IBOutlet weak var exdescription: UITextField!
    
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var amount: UITextField!
    @IBOutlet weak var type: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let indexPath = indexPath {
            price.text = Expense.expenses[indexPath.row].ExDate
            amount.text = String(Expense.expenses[indexPath.row].ExAmount)
            type.text = Expense.expenses[indexPath.row].ExType
            exdescription.text = Expense.expenses [indexPath.row].ExDescription
        }

     
    }
    

    @IBAction func addExpenses(_ sender: Any) {
        if indexPath == nil{
        self.appendData(type : type.text!, amount : amount.text!, exdescription : exdescription.text!, price : price.text!)
//        Expense.expenses[indexPath!.row].ExType = type.text!
//        Expense.expenses[indexPath!.row].ExDescription = exdescription.text!
//        Expense.expenses[indexPath!.row].ExAmount = amount.text!
//        Expense.expenses[indexPath!.row].ExDate = price.text!
        delegate?.tableView.reloadData()
        
        dismiss(animated: true)
         
        }
        
        else
        {
                    Expense.expenses[indexPath!.row].ExType = type.text!
                    Expense.expenses[indexPath!.row].ExDescription = exdescription.text!
            Expense.expenses[indexPath!.row].ExAmount = Int(amount.text!) ?? 0
                    Expense.expenses[indexPath!.row].ExDate = price.text!
                    delegate?.tableView.reloadData()
            dismiss(animated: true)
        }
    }
    func appendData(type: String, amount: String, exdescription: String, price: String) {
        Expense.expenses.append(Expense(ExType: type, ExDescription: exdescription, ExAmount: Int(amount) ?? 0, ExDate: price))
    }
    

}
