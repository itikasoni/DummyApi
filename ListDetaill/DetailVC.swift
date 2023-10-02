//
//  DetailVC.swift
//  ListDetaill
//
//  Created by Itika Soni on 02/10/23.
//

import UIKit
import Alamofire



class DetailVC: UIViewController ,UITableViewDelegate, UITableViewDataSource, DetailTVCDelegate{
    
    var myArr = [Datum]()
    
    @IBOutlet weak var tblVw: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblVw.delegate = self
        tblVw.dataSource = self
        tblVw.register(UINib(nibName: "DetailTVC", bundle: nil), forCellReuseIdentifier: "DetailTVC")
        getListOfEmployees()
        
    }
    
    
    func getListOfEmployees(){
        //        let params: Parameters = [
        //                "name": "Jack",
        //                "salary": "3540",
        //                "age": "23"
        //            ]
        
        AF.request("https://dummy.restapiexample.com/api/v1/employees", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).validate(statusCode: 200 ..< 299).responseData { response in
            switch response.result {
            case .success(let data):
                
                do{
                    let detailListModel = try? JSONDecoder().decode(DetailListModel.self, from: data)
                    if let data = detailListModel?.data {
                        self.myArr.append(contentsOf: detailListModel?.data ?? [])
                        self.tblVw.reloadData()
                    }
                    
                    
                }catch{
                    print("dfsd")
                }
                
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTVC", for: indexPath)as! DetailTVC
        let datum = myArr[indexPath.row]
        print(datum)
        cell.lblId.text = "\(datum.id)"
        cell.lblName.text = datum.employeeName
        cell.delegate = self
        
        return cell
    }
    func didSelectCell(withId id: Int) {
        let destinationViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RecordVC") as! RecordVC
        
        destinationViewController.id = id
        
//
//        if let employee =  myArr.first(where: { $0.id == id }) {
//            destinationViewController.id = employee.i
//            destinationViewController.name = employee.employeeName
//            destinationViewController.age = employee.employeeAge
//                destinationViewController.salary = employee.employeeSalary
//            }
        
        navigationController?.pushViewController(destinationViewController, animated: true)
        
        print(id)
    }
    
}


