//
//  TableViewDataSource.swift
//  Live Weather
//
//  Created by Nouman Pervez on 26/10/21.
//

import UIKit

class TableViewDataSource<CellType, ViewModel>: NSObject, UITableViewDataSource where CellType: UITableViewCell {
   
    var items: [ViewModel]
    var configureCell: (CellType, ViewModel) -> ()
    var cellIdentifier: String
    
    init(_ cellIdentifier: String, items: [ViewModel], configureCell: @escaping(CellType, ViewModel) ->() ) {
       
        self.items = items
        self.configureCell = configureCell
        self.cellIdentifier = cellIdentifier
    }
    
    func update(_ items: [ViewModel]) {
        self.items = items
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CellType
        let item = self.items[indexPath.row]
        self.configureCell(cell, item)
        return cell
    }
}
