//
//  WorkflowController.swift
//  WorkflowTest
//
//  Created by Christoffer Buusmann on 06/06/2022.
//

import Foundation

class WorkflowController: ObservableObject {
    
    // somehow add the configurations here...
    @Published private(set) var steps: [any StepConfiguration] = []
    
    func add(_ step: any StepConfiguration) {
        if !steps.contains(where: { $0.id == step.id }) {
            steps.append(step)
        } else {
            steps.removeAll(where: { $0.id == step.id })
            steps.append(step)
        }
    }
}
