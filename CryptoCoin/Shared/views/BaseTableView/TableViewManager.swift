//
//  TableViewManager.swift
//  CryptoCoin
//
//  Created by Ilfeld, Yehuda on 13/02/2023.
//

import UIKit


class TableViewManager<Data, Cell: UITableViewCell>: NSObject, UITableViewDataSource, UITableViewDelegate, ListView where Cell: BaseCell, Cell.Data == Data {
    
    var items: [Data]
    var cell: Cell.Type
    var didSelect: DidSelect<Data>?
    
    
    init(items: [Data], cell: Cell.Type, didSelect: DidSelect<Data>?) {
        self.items = items
        self.cell = cell
        self.didSelect = didSelect
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.identifier, for: indexPath) as? Cell else {
            return UITableViewCell()
        }
        cell.setup(item: self.items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.didSelect?(self.items[indexPath.row])
    }
}
