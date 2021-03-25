//
//  YDTableTestViewController.swift
//  FirstSwiftDemo
//
//  Created by lzt on 2021/3/25.
//

import UIKit

class YDTableTestViewController: YYBaseViewController {
    var scourceCount = 10
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(backScrollView)
        backScrollView.addSubview(tableView)
            //    backScrollView.isScrollEnabled = false
    }
    private lazy var tableView : UITableView = {
        let view = UITableView.init(frame: self.view.bounds)
        view.tableFooterView = UIView()
        view.dataSource = self
        view.delegate = self
        view.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return view
    }()
    private lazy var backScrollView : YYMuteScrollView = {
        let view = YYMuteScrollView.init(frame: self.view.bounds)
        view.contentSize = CGSize.init(width: self.view.frame.size.width * 2, height: self.view.frame.height)
        view.backgroundColor = .red
        view.isPagingEnabled = true
        return view
    }()
    
}
extension YDTableTestViewController: UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scourceCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
 
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let action = UITableViewRowAction.init(style: UITableViewRowAction.Style.destructive, title: "删除") {[weak self] (action, indexPath) in
            guard let self = self else {return}
            self.scourceCount -= 1
            self.tableView.deleteRows(at: [indexPath], with: .top)
        }
        
        return [action]
    }
//    func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
//            self.backScrollView.isScrollEnabled = false
//    }
//
//    func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
//           self.backScrollView.isScrollEnabled = true
//    }
//    @available(iOS 11.0, *)
//       func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//           if indexPath.section == 0  {
//
//               let hideAction = UIContextualAction(style: .normal, title: "删除") { [weak self] (action, sourceView, complete) in
//                   guard let `self` = self else {return}
//
//                   complete(true)
//               }
//
//               let actions = UISwipeActionsConfiguration(actions: [hideAction])
//               actions.performsFirstActionWithFullSwipe = false
//               return actions
//           }
//           return nil
//       }
    
    
}

class YYMuteScrollView: UIScrollView , UIGestureRecognizerDelegate {
    
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        
        let view = super.hitTest(point, with: event)
        if (view?.superview?.isMember(of: UITableViewCell.self)) ?? false{
            self.isScrollEnabled = false
        }else {
            self.isScrollEnabled = true
        }
        return view
    }

}
