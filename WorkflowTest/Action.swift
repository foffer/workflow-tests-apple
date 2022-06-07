//
//  Action.swift
//  WorkflowTest
//
//  Created by Christoffer Buusmann on 29/05/2022.
//

import Foundation
import SwiftUI

enum Action: String, CaseIterable, Identifiable {
    
    var id: String { rawValue }
    case rename
    case upload
    
    @ViewBuilder
    func label() -> some View {
        switch self {
        case .rename:
            RenameLabel()
        case .upload:
            UploadLabel()
        }
    }
    
    @ViewBuilder
    func main() -> some View {
        switch self {
        case .rename:
            RenameView()
        case .upload:
            UploadView()
        }
    }
}

