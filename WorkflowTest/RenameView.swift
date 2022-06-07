//
//  RenameView.swift
//  WorkflowTest
//
//  Created by Christoffer Buusmann on 06/06/2022.
//

import SwiftUI
import Combine

struct RenameView: View {
    @EnvironmentObject var controller: WorkflowController
    @StateObject var viewModel = RenameViewModel()
    
    var body: some View {
        TextField("Rename to", text: $viewModel.text)
            
            .onChange(of: viewModel.configuration) { configuration in
                    // Add the step to the controller here somehow
                controller.add(configuration)
            }
    }
}

struct RenameView_Previews: PreviewProvider {
    static var previews: some View {
        RenameView()
    }
}

struct RenameConfiguration: StepConfiguration, Hashable {
    
    let id = "com.cewbed.CardFlow.step.rename"
    let newName: String
    
    func run(with files: [File]) -> [File] {
        files
            .map(rename)
    }
    
    private func rename(_ file: File) -> File {
        file.name = newName
        return file
    }
    
}

class RenameViewModel: ObservableObject {
    
    private var cancellables: Set<AnyCancellable> = []
    @Published var text: String = "" {
        didSet {
            textSubject.send(text)
        }
    }
    var textSubject = CurrentValueSubject<String, Never>("")
    @Published var configuration: RenameConfiguration = .init(newName: "")
    
    init() {
        configurePublishers()
    }
    
    private func configurePublishers() {
        textSubject
            .print()
            .debounce(for: .seconds(1), scheduler: RunLoop.main)
            .map { RenameConfiguration(newName: String($0)) }
            .assign(to: &$configuration)
            
    }
}
