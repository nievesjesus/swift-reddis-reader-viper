//
//  RestClient.swift
//  Viper-Reddis-Reader
//
//  Created by Jesus Nieves on 24/05/2021.
//

import Foundation

struct RestClient<Model: Codable> {

    typealias SuccessCompletionHandler = (_ response: Model) -> Void

    static func request(path: String, delegate: ErrorDelegate?,
                        url: String,
                        success successCallback: @escaping SuccessCompletionHandler) {

        var dataTask: URLSessionDataTask?
        let defaultSession = URLSession(configuration: .default)
        dataTask?.cancel()

        if let urlComponents = URLComponents(string: url) {
            guard let url = urlComponents.url else {
                return
            }

            dataTask =
                defaultSession.dataTask(with: url) { data, response, error in
                    defer {
                        dataTask = nil
                    }
                    if error != nil {
                        delegate?.showError()
                    } else if

                        let data = data,
                        let response = response as? HTTPURLResponse,
                        response.statusCode == 200 {
                            do {
                                let json = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary

                                if let dictAtPath = json?.value(forKeyPath: path) {
                                    let jsonData = try JSONSerialization.data(withJSONObject: dictAtPath,
                                                                              options: .prettyPrinted)
                                    let decoder = JSONDecoder()
                                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                                    let model =  try decoder.decode(Model.self, from: jsonData)
                                    successCallback(model)
                                } else {
                                    delegate?.showError()
                                }

                            } catch {
                                delegate?.showError()
                            }
                        }
            }
            dataTask?.resume()
        }
    }
}
