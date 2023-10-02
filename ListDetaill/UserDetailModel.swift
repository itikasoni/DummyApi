//
//  UserDetailModel.swift
//  ListDetaill
//
//  Created by Itika Soni on 02/10/23.
//

import Foundation

// MARK: - UserDetailModel
struct UserDetailModel: Codable {
    let status: String
    let data: DataClass
    let message: String
}

// MARK: - DataClass
struct DataClass: Codable {
    let id: Int
    let employeeName: String
    let employeeSalary, employeeAge: Int
    let profileImage: String

    enum CodingKeys: String, CodingKey {
        case id
        case employeeName = "employee_name"
        case employeeSalary = "employee_salary"
        case employeeAge = "employee_age"
        case profileImage = "profile_image"
    }
}
