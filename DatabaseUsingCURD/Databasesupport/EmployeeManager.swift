//
//  EmployeeManager.swift
//  DatabaseUsingCURD
//
//  Created by devang bhavsar on 28/07/20.
//  Copyright © 2020 devang bhavsar. All rights reserved.
//

import Foundation
import CoreData

struct EmployeeManager {
    
    private let _employeeDataRepository = EmployeeDataRepository()
    
    func createEmployee(employee:Employee)  {
        _employeeDataRepository.create(employee: employee)
    }
    
    func fetchEmployee(byIdentifier id: UUID) -> Employee? {
        return _employeeDataRepository.get(byIdentifier: id)
    }
    func fetchEmployee() -> [Employee]? {
       return _employeeDataRepository.getAll()
    }
    func updateEmployee(employee:Employee) -> Bool {
        return _employeeDataRepository.update(employee: employee)
    }
    func deleteEmployee(id:UUID) -> Bool {
        return _employeeDataRepository.delete(record: id)
    }
}
