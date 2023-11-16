//
//  Table.swift
//  ToDo
//
//  Created by flash on 11/16/23.
//

import Foundation
import UIKit

class Table{
    static let shared = Table()
    
    public func table()->UITableView{
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return table
    }
}
