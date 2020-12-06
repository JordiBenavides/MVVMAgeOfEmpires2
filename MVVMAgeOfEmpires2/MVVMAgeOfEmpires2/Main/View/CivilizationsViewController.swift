//
//  ViewController.swift
//  MVVMAgeOfEmpires2
//
//  Created by Jordi Milla on 04/12/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import Foundation
import UIKit
import Moya

class CivilizationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = ViewModelCivilization()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTable()
        configureView()
        bind()
    }
    
    private func configureView() {
     viewModel.retriveDataCivilization()
    }

    private func bind() {
        viewModel.refreshData = { [weak self] () in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    func setTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         
        return viewModel.dataArray.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as? CustomTableViewCell
        let civilization = viewModel.dataArray[indexPath.row]
        cell?.configure(civilizations: civilization)
        
        return cell ?? UITableViewCell()
     }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
        vc.id = viewModel.dataArray[indexPath.row].id
            navigationController?.pushViewController(vc,
                                               animated: true)
    }
}

