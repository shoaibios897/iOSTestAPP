//
//  JsonFileHelper.swift
//  iOSTestApp
//
//  Created by Apple on 22/06/2022.
//

import Foundation
import Foundation

class JsonFileHelper {
    
    
    // MARK:- PUBLIC VARS
    static let shared = JsonFileHelper()
    
    // MARK:- PRIVATE VARS
    private let fileName = "data"
    
    
    // MARK:- INITIALIZERS
    private init() {}
    
    
    // MARK:- PUBLIC METHODS
    func fetchDataFromJson() -> [UserStruct]? {
        
        if let jsonData = self.readJSONFile() {
            if let users = self.parse(jsonData: jsonData) {
                return users
            }
        }
        return nil
    }
    
    
    func updateDataInJson(users: [UserStruct]) {
        
    }
    
    
    // MARK:- PRIVATE METHODS
    private func readJSONFile() -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: fileName, ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        return nil
    }
    
    private func parse(jsonData: Data) -> [UserStruct]? {
        do {
            let decodedData = try JSONDecoder().decode([UserStruct].self, from: jsonData)
            return decodedData
        } catch {
            print(error.localizedDescription)
        }
        
        return nil
    }
}
