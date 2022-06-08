//
//  StepConfiguration.swift
//  WorkflowTest
//
//  Created by Christoffer Buusmann on 06/06/2022.
//

import Foundation

protocol StepConfiguration: Hashable {
    var id: String { get }
    var isConfigured: Bool { get }
    func run(with files: [File]) -> [File]
}
