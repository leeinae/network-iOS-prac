//
//  ViewController.swift
//  network-iOS-prac
//
//  Created by inae Lee on 2020/11/26.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var personList: [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPersonData()
        
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(personList.count)
        return personList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else {
            return UITableViewCell()
        }
        
        cell.setCell(person: personList[indexPath.row])
        return cell
    }
}

extension ViewController {
    func getPersonData() {
        ImageService.shared.getImage { (networkResult) -> (Void) in
            switch (networkResult) {
            case .success(let data):
                if let personData = data as? [Person] {
                    for item in personData {
                        self.personList.append(item)
                    }
                }
                print("success!")
            case .pathErr:
                print("path Err")
            case .requestErr(let msg):
                print(msg)
            case .networkFail:
                print("network Err")
            case .serverErr:
                print("server Err")
            }
            
            DispatchQueue.main.async {
                print("reload!")
                self.tableView.reloadData()
            }
        }
    }
}
