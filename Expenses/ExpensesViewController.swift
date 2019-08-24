//
//  ExpensesViewController.swift
//  Expenses
//
//  Created by Kartik Sharma on 8/23/19.
//  Copyright © 2019 Kartik Sharma. All rights reserved.
//

import UIKit

class ExpensesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
  // self.tableView.dataSource = self
   //self.tableView.delegate = self
    
    struct Expense {
        var title: String
        var amount: Double
        var date: Date?
    }
    
    
    var expenses = [Expense]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, yyyy H:mm"

        
        expenses = [
            Expense(title: "Dinner", amount: 32.50, date: dateFormatter.date(from: "June 1, 2018 18:30")),
            Expense(title: "Office Supplies", amount: 59.34, date: dateFormatter.date(from: "May 30, 2018 12:17")),
            Expense(title: "Uber", amount: 16.23, date: dateFormatter.date(from: "May 30, 2018 11:43")),
            Expense(title: "Coffee", amount: 3.95, date: dateFormatter.date(from: "May 29, 2018 8:45"))
        ]
    }
    
    
    
    
    

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "expenseCell", for: indexPath)
        
        let expense = expenses[indexPath.row]
        
        if let cell = cell as? ExpenseTableViewCell {
        cell.titleLabel.text = expense.title
        cell.amountLabel.text = String(expense.amount)
        cell.dateLabel?.text = dateFormatter.string(from: expense.date!)
        }
        return cell
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
