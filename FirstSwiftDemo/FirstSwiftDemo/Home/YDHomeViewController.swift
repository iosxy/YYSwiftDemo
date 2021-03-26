//
//  YDHomeViewController.swift
//  FirstSwiftDemo
//
//  Created by lzt on 2021/3/23.
//

import UIKit

class YDHomeViewController: YYBaseViewController {

    var dataSouce: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "首页"
        self.setUpDataSource()
        self.view.addSubview(tableView)
    }
    private lazy var tableView : UITableView = {
        let view = UITableView.init(frame: self.view.bounds)
        view.tableFooterView = UIView()
        view.dataSource = self
        view.delegate = self
        view.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return view
    }()

}
extension YDHomeViewController {
    
    func setUpDataSource(){
        
        self.dataSouce.append("左滑删除和背景滚动视图手势冲突测试")
        self.dataSouce.append("网络请求测试")
        tableView.reloadData()
    }
    
    
}
extension YDHomeViewController: UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSouce.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dataSouce[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            let vc = YDTableTestViewController()
            navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 1 {
            let vc = YYTestNetWorkViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
