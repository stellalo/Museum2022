//
//  DataService.swift
//  Museum2022
//
//  Created by stella on 2022-01-17.
//

import Foundation
class DataService{
    
    static func getLocalData() -> [Museum]{
        //get the path to the jason file within the app bundle
        //path(forResource:"filename",ofType:"extension"
        //can potentially return nil, if not nil, returns a string
        let pathString = Bundle.main.path(forResource: "data", ofType: "json")
        //check if pathStrign is not nil, otherwise, return an empty recipe list
        guard pathString != nil else{
            //return an empty museum list
            return [Museum]()
        }
        //create a url object
        //unwrap with !
        let url = URL(fileURLWithPath: pathString!)
        do{
            //create a data object with the data at the url
            let data =  try Data(contentsOf: url)
            //parse the data
            let decoder = JSONDecoder()
            //will turn data into an array of museums, and will be assigned to museumData
            do{
                let museumData = try decoder.decode([Museum].self, from: data)
                
                //set unique ids to each instances
                for m in museumData{
                    //set unique ids to each museums in museumData
                    m.id = UUID()
                }
                //return the museums
                return museumData
            }
            catch{
                print(error)
            }
        }
        catch{
            print(error)
        }
        return [Museum]()
    }
    
}
