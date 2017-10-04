//
//  MainScreenCoordinator.swift
//  wallEEt
//
//  Created by ParaBellum on 10/1/17.
//  Copyright © 2017 ParaBellum. All rights reserved.
//

import UIKit
class  MainScreenCoordinator: Coordinator {
    var viewModel:MainScreenViewModelType!
    var vc:MainScreenViewController!
    func start(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let mainVC = storyboard.instantiateViewController(withIdentifier: "MainScreen") as? MainScreenViewController {
            vc = mainVC
            let VM = MainScreenViewModel()
            VM.coordinatorDelegate = self
            mainVC.viewModel = VM
            viewModel = VM
            navController?.pushViewController(mainVC, animated: true)

        }
    }
    deinit {
        print("Coordinator deinit")
    }
}
extension MainScreenCoordinator:MainScreenViewModelCoordinatorDelegate{
    func mainScreenViewModelDidTapNext() {
        let detailCoordinator = ExpenseDetailCoordinator(navController: navController)
        detailCoordinator.delegate = self
        detailCoordinator.start()
        childCoordinators.append(detailCoordinator)
        
    }
}

extension MainScreenCoordinator:ExpenseDetailCoordinatorDelegate{
    func detailCoordinatorDidPassText(text: String) {
        viewModel.stringToShow = text
        self.navController?.popViewController(animated: true)
        self.childCoordinators.removeAll()
    }
    
    func detailCoordinatorDidFinish(detailCoordinator: ExpenseDetailCoordinator) {
        self.navController?.popViewController(animated: true)
        self.childCoordinators.removeAll()
    }
    
    
}