//
//  JSONParser.swift
//  Lenskart
//
//  Created by Vinay Raj on 29/05/21.
//

import Foundation

public enum JSONParser {
    
    static func modelFromFile<T>(fileName: String, fileExtension: String = "json") -> T?  where T: Decodable {
        guard let path = Bundle.main.path(forResource: fileName, ofType: fileExtension) else {
            debugPrint("\(fileName).\(fileExtension) no such file exists")
            return nil
        }
        do {
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: path))
            let parsedModel = try JSONDecoder().decode(T.self, from: jsonData)
            return parsedModel
        } catch let error {
            debugPrint("error while decoding ", error.localizedDescription)
            return nil
        }
    }
    
}
