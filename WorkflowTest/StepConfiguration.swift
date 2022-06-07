//
//  StepConfiguration.swift
//  WorkflowTest
//
//  Created by Christoffer Buusmann on 06/06/2022.
//

import Foundation

protocol StepConfiguration {
    var id: String { get }
    func run(with files: [File]) -> [File]
}
