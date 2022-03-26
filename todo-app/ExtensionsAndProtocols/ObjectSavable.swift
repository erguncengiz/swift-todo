//
//  ObjectSavable.swift
//  todo-app
//
//  Created by Ergün Yunus Cengiz on 26.03.2022.
//

import Foundation

protocol ObjectSavable {
    func setObject<Object>(_ object: Object, forKey: String) throws where Object: Encodable
    func getObject<Object>(forKey: String, castTo type: Object.Type) throws -> Object where Object: Decodable
}
