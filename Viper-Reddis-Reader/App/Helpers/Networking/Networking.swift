//
//  Networking.swift
//  Viper-Reddis-Reader
//
//  Created by Jesus Nieves on 24/05/2021.
//

import UIKit

public enum Result<T> {
    case success(T)
    case failure(Error)
}

final class Networking: NSObject {

    private static func getData(url: URL,
                                completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }

    public static func downloadImage(url: URL,
                                     completion: @escaping (Result<Data>) -> Void) {
        self.getData(url: url) { data, _, error in

            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data, error == nil else {
                return
            }

            DispatchQueue.main.async {
                completion(.success(data))
            }
        }
    }
}
