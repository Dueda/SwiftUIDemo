//
//  ModelData.swift
//  SwiftUIDemo
//
//  Created by dueda on 2021/5/28.
//

import Foundation

var landmarks:[Landmark] = load("landmarkData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("找不到存储文件")
    }
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch  {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
