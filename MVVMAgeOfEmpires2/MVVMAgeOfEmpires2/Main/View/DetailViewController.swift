//
//  DetailViewController.swift
//  MVVMAgeOfEmpires2
//
//  Created by Jordi Milla on 04/12/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import Foundation
import UIKit
import Moya

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var teamBonusLabel: UILabel!
    
    var id: Int?
    var viewModelDetail = ViewModelDetail()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModelDetail.id = self.id
        configureView()
        bind()
    }
    private func configureView() {
        guard let id = self.id else { return }
        viewModelDetail.requestCiviById(id: id)
    }

    private func bind() {
        viewModelDetail.refreshDataDetail = { [weak self] () in
            DispatchQueue.main.async {
                self?.updateLabels()
            }
        }
    }
    
    func updateLabels(){
        nameLabel.text = viewModelDetail.dataDetail.name
        teamBonusLabel.text = viewModelDetail.dataDetail.team_bonus        
    }
    
}
