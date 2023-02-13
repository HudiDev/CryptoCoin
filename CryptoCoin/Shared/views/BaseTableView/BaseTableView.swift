//
//  BaseTableView.swift
//  CryptoCoin
//
//  Created by Ilfeld, Yehuda on 13/02/2023.
//

import UIKit


class BaseTableView<Data, Cell: UITableViewCell>: UITableView where Cell: BaseCell, Cell.Data == Data {
    
    var items: [Data] {
        didSet { self.tableViewManager.items = items }
    }
    
    var tableViewManager: TableViewManager<Data, Cell>
    
    init(items: [Data], cell: Cell.Type, didSelect: DidSelect<Data>?) {
        self.items = items
        self.tableViewManager = TableViewManager(items: items, cell: cell, didSelect: didSelect)
        
        super.init(frame: .zero, style: .plain)
        
        self.delegate = self.tableViewManager
        self.dataSource = self.tableViewManager
        self.register(cell, forCellReuseIdentifier: cell.identifier)
        self.separatorStyle = .singleLine
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

