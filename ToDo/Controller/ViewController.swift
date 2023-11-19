//
//  ViewController.swift
//  ToDo
//
//  Created by flash on 11/16/23.
//

import UIKit

class ViewController: UIViewController {
    
    let table = Table.shared.table()
    var items = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.items = UserDefaults.standard.stringArray(forKey: "items") ?? []
        title = "To Do"
        view.backgroundColor = .systemBackground
        view.addSubview(table)
        table.delegate = self
        table.dataSource = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapped))
    }
    @objc private func didTapped(){
        let alert = UIAlertController(title: "Add New", message: "Enter New To Do", preferredStyle: .alert)
        alert.addTextField{ field in
            field.placeholder = "Enter new todo"
            
        }
       
      
        
        alert.addAction(UIAlertAction(title: "Cancle", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { [weak self] (_) in
            if let field = alert.textFields?.first{
                if let text = field.text, !text.isEmpty{
                   
                    DispatchQueue.main.async {
                        var currentItems = UserDefaults.standard.stringArray(forKey: "items") ?? []
                        currentItems.append(text)
                        UserDefaults.standard.setValue(currentItems, forKey: "items")
                        self?.items.append(text)
                        self?.table.reloadData()
                    }
                    
                }
            }
        }))
        
        present(alert, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        table.frame = view.bounds
    }
    func dateToString(date: Date, format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    
}
extension ViewController: UITableViewDelegate{
    
}
extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let label1 = UILabel(frame: CGRect(x: 20, y: 5, width: 400, height: 20))
        label1.text = items[indexPath.row]
        cell.contentView.addSubview(label1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Modify", message: "Delete Todo", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancle", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Delete", style: .default, handler: { [weak self] (_) in
            let text = self?.items[indexPath.row]
            DispatchQueue.main.async {
                var currentItems = UserDefaults.standard.stringArray(forKey: "items") ?? []
                currentItems.removeAll(where: { $0 == text })
                UserDefaults.standard.setValue(currentItems, forKey: "items")
                self?.items.removeAll(where: { $0 == text})
                self?.table.reloadData()
            }
            
        }))
        
        present(alert,animated: true)
    }
}

