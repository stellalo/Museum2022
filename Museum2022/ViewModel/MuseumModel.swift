//
//  MuseumModel.swift
//  Museum2022
//
//  Created by stella on 2022-01-17.
//

import Foundation
import SwiftUI

class MuseumModel: ObservableObject{
    @Published var museums = [Museum]()
    init(){
        //create an instance of data service and get the data
        self.museums = DataService.getLocalData()
        //getRemoteData()
    }
    
    func getRemoteData(){
        //string path
        let urlString = "https://stellalo.github.io/Museum-Data/MuseumData.json"
        //create a url object
        let url = URL(string: urlString)
        guard url != nil else{
            //couldn't create url
            return
        }
        //create a url request
        let Request = URLRequest(url: url!)
        //get the session and kick off the task
        let session = URLSession.shared
        let dataTask = session.dataTask(with: Request){ data, response, error in
            //check if there is an error
            guard error == nil else{
                //there was an error
                return
            }
            do{
                //create a json decoder
                let decoder = JSONDecoder()
                //decode
                let museumData = try decoder.decode([Museum].self, from:data!)
                //append parsed modules into Module property
                self.museums += museumData
            }
            catch{
                
            }
        }
        //kick off data task
        dataTask.resume()
    }
   
}
