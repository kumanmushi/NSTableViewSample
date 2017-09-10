//
//  ViewController.swift
//  NSTableViewSample
//
//  Created by 村田真矢 on 2017/09/08.
//  Copyright © 2017年 村田真矢. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {

    @IBOutlet weak var TableView: NSTableView!
    
    private let stringArray: [String] = ["test1", "test2", "test3"]
    private let imageNameArray: [String] = ["test1", "test2", "test3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table View Data Sourse
    func numberOfRows(in tableView: NSTableView) -> Int {
        return self.stringArray.count
    }


    // MARK: - Table View Delegate
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let columnIdentifier: String = tableColumn?.identifier else {
            return nil
        }
        
        let stringColumn: String = "String", imageColumn: String = "Image", buttonColumn: String = "Button"
        switch columnIdentifier {
        case stringColumn:
            if let cell = tableView.make(withIdentifier: stringColumn, owner: self) as? NSTableCellView{
                cell.textField?.stringValue = self.stringArray[row]
                return cell
            }
            
        case imageColumn:
            if let cell = tableView.make(withIdentifier: imageColumn, owner: self) as? NSTableCellView{
                cell.imageView?.image = NSImage(named: self.imageNameArray[row])
                return cell
            }
            
        case buttonColumn:
            break
        
        default:
            break
        }
        return nil
    }
}
