//
//  Joke.swift
//  SimpleChuck
//
//  Created by Peter Forward on 3/10/22.
//

import Foundation

struct Joke : Codable {

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

}

typealias Welcome = [String]
