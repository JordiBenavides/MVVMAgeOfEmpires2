//
//  ViewModelDetail.swift
//  MVVMAgeOfEmpires2
//
//  Created by Jordi Milla on 04/12/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import Foundation
import UIKit
import Moya

//let provider = MoyaProvider<CivilizationsAPI>()

class ViewModelDetail {
    
    let provider = MoyaProvider<CivilizationsAPI>()
    
    var id: Int? 
// Crear un mecanismo para enlazar lo que seria la vista con el modelo de la vista
var refreshDataDetail = { () -> () in }

// Fuente de datos
    var dataDetail: Civilizations = Civilizations(id: 0, name: "", army_type: "", team_bonus: "") {
    didSet {
        refreshDataDetail()
    }
}

// Mapear los datos de la API
    
    func requestCiviById(id: Int) {

        provider.request(.getCiviById(id:id)) { result in
            switch result {
            case .success(let response):
                print("success")
                let civi : Civilizations = try! response.map(Civilizations.self)
                self.dataDetail = civi
//                self.updateLabels()
            case .failure:
                print("Error")
            }
        }
    }
}
