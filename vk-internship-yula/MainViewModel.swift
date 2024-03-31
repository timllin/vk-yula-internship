//
//  MainViewModel.swift
//  vk-internship-yula
//
//  Created by Тимур Калимуллин on 30.03.2024.
//

import Foundation
import Combine
import SwiftUI

final class MainViewModel: ObservableObject {
    @Published var services: [Service] = []
    private var cancellables = Set<AnyCancellable>()

    public func fetchServices() {
        URLSession.shared
            .dataTaskPublisher(for: ServicesAPI.getServices.urlRequest)
            .receive(on: DispatchQueue.main)
            .map(\.data)
            .decode(type: APIResponse.self, decoder: JSONDecoder())
            .sink { result in
            } receiveValue: { [weak self] data in
                self?.services = data.body.services
            }
            .store(in: &cancellables)
    }

    public func openService(_ service: Service)  {
        guard let appScheme = URL(string: service.link) else { return }
        if UIApplication.shared.canOpenURL(appScheme) {
            UIApplication.shared.open(appScheme)
        }
    }
}
