//
//  RecordVC.swift
//  ListDetaill
//
//  Created by Itika Soni on 02/10/23.
//

import UIKit
import Alamofire

class RecordVC: UIViewController {
    var id : Int?
    var name: String?
    var age : Int?
    var salary : Int?
   // var profileImage: UIImage?

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var lblEmployesName: UILabel!
    @IBOutlet weak var lblEmployesSalary: UILabel!
    @IBOutlet weak var lblEmployesAge: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUserDetails(id: id!)
        setupUI()
    }
    
    func setupUI() {
        lblEmployesName.text = name
           lblEmployesAge.text = "\(age ?? 0)"  
           lblEmployesSalary.text = "\(salary ?? 0)"
        }
    
    func getUserDetails(id:Int){
        let url = "https://dummy.restapiexample.com/api/v1/employee/"+String(id)
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).validate(statusCode: 200 ..< 299).responseData { response in
            switch response.result {
            case .success(let jsonData):
                let userDetailModel = try? JSONDecoder().decode(UserDetailModel.self, from: jsonData)
  
                guard let jsonresponse = userDetailModel?.data else {
                    print("error aa gaye aa")
                    return
                }
                
               self.lblEmployesName.text = jsonresponse.employeeName
               self.lblEmployesAge.text = String(jsonresponse.employeeAge)
               self.lblEmployesSalary.text = String(jsonresponse.employeeSalary)
             
            case .failure(let error):
                print(error)
            }
        }
        
    }
}
