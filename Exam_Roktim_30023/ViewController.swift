//
//  ViewController.swift
//  Exam_Roktim_30023
//
//  Created by Bjit on 14/12/22.
//

import UIKit
struct Expense {
    var ExType: String
    var ExDescription: String
    var ExAmount : Int
    var ExDate : String
}

//extension Item {
//    static var items = [Item(ItemName: "Pen", ItemPrice: "$30" , image: "kaka"),
//                           Item(ItemName: "Pencil", ItemPrice: "$60", image: "kaka"), Item(ItemName: "Book", ItemPrice: "$30", image: "kaka"),
//                           Item(ItemName: "Mobile", ItemPrice: "$600", image: "kaka")]
//}
extension Expense
{
    static var expenses = [Expense(ExType: "daily", ExDescription: "Rice", ExAmount: 200, ExDate: "14-12-2022") , Expense(ExType: "daily", ExDescription: "Coffee", ExAmount: 25, ExDate: "14-12-2022"), Expense(ExType: "daily", ExDescription: "Pulse", ExAmount: 30, ExDate: "14-12-2022"), Expense(ExType: "daily", ExDescription: "Ginger", ExAmount: 50, ExDate: "14-12-2022"), Expense(ExType: "weekly", ExDescription: "Vegetables", ExAmount: 20, ExDate: "14-12-2022"), Expense(ExType: "monthly", ExDescription: "Beef", ExAmount: 20, ExDate: "14-12-2022")
    ]
}
class ViewController: UIViewController, UITableViewDelegate {
    var selectedIndexPath: IndexPath!
    var sum = 0
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        let nib = UINib(nibName: "Customheader", bundle: nil)
      tableView.register(nib, forHeaderFooterViewReuseIdentifier: "Customheader")
//                var sum = 0
//                for i in 0..<Expense.expenses.count
//                {
//                    sum += Expense.expenses[i].ExAmount
//
//                }
                
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        
        performSegue(withIdentifier: "segueway" , sender: nil)
        performSegue(withIdentifier: "segueway2" , sender: nil)
    }
    

    
}
extension ViewController : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Expense.expenses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customtableview", for: indexPath) as!CustomCell
        //return cell
        cell.type.text = Expense.expenses[indexPath.row].ExType
        cell.exdescription.text = Expense.expenses[indexPath.row].ExDescription
        cell.amount.text = String(Expense.expenses[indexPath.row].ExAmount)
        cell.exdate.text = Expense.expenses[indexPath.row].ExDate
        return cell
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // while delete btn pressed, the closour will be xecuted
        // if we pass self to a closour, then it should be weak
        // Retention cycle = weak self = Can be no longer keep it to memory
        
        
        
        let deleteAction = UIContextualAction(style: .destructive, title: nil) {[weak self] _,_,completion in
            
            // self to accedd properties of viewContlooer
            guard let self = self else {return}
            
            self.handleDeleteAction(indexPath: indexPath)
//            completion(true) // It's true if succesfully done
        }
        
        let editAction = UIContextualAction(style: .normal, title: nil) {[weak self] _,_,completion in
            
            // self to accedd properties of viewContlooer
            if indexPath.section == 0 {
                self!.selectedIndexPath = indexPath
                self!.performSegue(withIdentifier: "segueway2", sender: nil)
               
               // Expense.expenses.remove(at: indexPath.row)
              //  tableView.deleteRows(at: [indexPath], with: .bottom)
               
            }
            guard let self = self else {return}
            
            self.handleEditAction(indexPath: indexPath)
            completion(true) // It's true if succesfully done
          
        }
        
        deleteAction.image = UIImage(systemName: "trash")
        deleteAction.backgroundColor = .systemRed
        
        editAction.image = UIImage(systemName: "pencil")
        editAction.backgroundColor = .blue
        
        let swipAction =  UISwipeActionsConfiguration(actions: [deleteAction, editAction])
        swipAction.performsFirstActionWithFullSwipe = false
        return swipAction
    }
    
    func handleDeleteAction(indexPath: IndexPath) {
        tableView.beginUpdates()
        Expense.expenses.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .bottom)
        tableView.endUpdates()
        tableView.reloadData()
    }
    
    func handleEditAction(indexPath: IndexPath) {
        print("Edited")
        
//        Expense.expenses[indexPath.row] = Expense(ExType: "weekly", ExDescription: "Chicken", ExAmount: "400tk", ExDate: "14-12-2022")
//        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "Customheader") as! Customheader
        var sum = 0
        for i in 0..<Expense.expenses.count
        {
            sum += Expense.expenses[i].ExAmount

        }
        header.nibView.text = "Total Expenses \(sum)"
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueway" {
            if let nextPage = segue.destination as? SecondViewController{
                nextPage.indexPath = selectedIndexPath
                nextPage.delegate = self
            }
        }
        
        if segue.identifier == "segueway2" {
            if let nextPage = segue.destination as? SecondViewController{
                nextPage.indexPath = selectedIndexPath
                nextPage.delegate = self
            }
        }
     
    }

    
    
}


