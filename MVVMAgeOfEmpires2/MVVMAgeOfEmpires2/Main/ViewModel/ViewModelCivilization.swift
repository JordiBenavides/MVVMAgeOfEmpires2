//
//  ViewModelCivilization.swift
//  MVVMAgeOfEmpires2
//
//  Created by Jordi Milla on 04/12/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import Foundation
import UIKit
import Moya

let provider = MoyaProvider<CivilizationsAPI>()

class ViewModelCivilization {

// Crear un mecanismo para enlazar lo que seria la vista con el modelo de la vista
var refreshData = { () -> () in }

// Fuente de datos(Array)
var dataArray: [Civilizations] = [] {
    didSet {
        refreshData()
    }
}

// Mapear los datos de la API
    
    func retriveDataCivilization() {
          
          provider.request(.getCivilization) { result in
              switch result {
              case .success(let response):
                  print("success")
                  let array: [Civilizations] = try! response.map(ResponseAPI.self).civilizations
//                  self.data = array
//                  self.tableView.reloadData()
              case .failure:
                  print("Error")
              }
          }
      }
}
