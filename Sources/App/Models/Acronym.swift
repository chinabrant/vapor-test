//
//  Acronym.swift
//  App
//
//  Created by brant on 14/3/2019.
//

import Foundation
import Vapor
import FluentSQLite

// 所有的Fluent Model一定要实现Codable协议

final class Acronym: Codable {
    var id: Int?
    var short: String
    var long: String
    
    init(short: String, long: String) {
        self.short = short
        self.long = long
    }
}

extension Acronym: Model {
    // 声明Fluent 使用的数据库
    typealias Database = SQLiteDatabase
    // 声明id的类型
    typealias ID = Int
    // 声明id在model中对应的字段
    public static var idKey: IDKey = \Acronym.id
}

// 上面的可以简写为
//extension Acronym: SQLiteModel {}

// 要保存model到数据库，必须建表，Fluent通过 Migration来实现。
// Fluent 会根据Codable协议来自动推断表结构
extension Acronym: Migration {}

extension Acronym: Content {}
