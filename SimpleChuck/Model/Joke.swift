//
//  Joke.swift
//  SimpleChuck
//
//  Created by Peter Forward on 3/10/22.
//

import Foundation

struct Joke : Codable, Identifiable {
    
    let iconUrl : String?
    let id : String?
    let url : String?
    let value : String?
    
    enum CodingKeys: String, CodingKey {
        case iconUrl = "icon_url"
        case id = "id"
        case url = "url"
        case value = "value"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        iconUrl = try values.decodeIfPresent(String.self, forKey: .iconUrl)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        value = try values.decodeIfPresent(String.self, forKey: .value)
    }
    init(iconUrl : String, id : String, url : String, value : String) {
        self.iconUrl = iconUrl
        self.id = id
        self.url = url
        self.value = value
    }
    
}
extension Joke {
    static let empty = Joke(iconUrl: "None", id: "None", url: "None", value: "None")
}

struct JokeCategory : Codable, Identifiable {
    let id = UUID()
    let category : String
}
typealias Welcome = [String]
