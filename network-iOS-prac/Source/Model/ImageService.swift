//
//  ImageService.swift
//  network-iOS-prac
//
//  Created by inae Lee on 2020/11/26.
//

import Foundation
import Alamofire

struct ImageService {
    static let shared = ImageService()
    
    func getImage(completion: @escaping ((NetworkResult<Any>) -> (Void))) {
        let url = APIConstants.getImageURL
        let header: HTTPHeaders = ["Content-Type":"application/json"]
        
        let dataRequest = AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header)
        dataRequest.responseData { (response) in
            switch(response.result) {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let body = response.value else {return}
                
                completion(parseToJSON(status: statusCode, data: body))
            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
            
        }
    }
    
    func parseToJSON(status: Int, data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(APIResponse.self, from: data) else {return .pathErr}
        
        switch status {
        case 200:
            return .success(decodedData.tests)
        case 400:
            return .pathErr
        case 404:
            return .requestErr("Not Found Error")
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
}
