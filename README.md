<h1>MUSEUM APP</h1>

 ### [Video Demonstration](https://drive.google.com/file/d/1fmqUGyxzjOX4t--1xCCM6CpqQBO3lvdv/view?usp=sharing)

<h2>Description</h2>
The MUSEUM App is a city-based museum version of LetterBoxd that includes more than 50 museums in 10+ cities around the world. 

For detailed project development story, please visit [here](https://stella-lo.webflow.io/work/museumapp)!


<h2>Languages and Utilities Used</h2>

- <b>SwiftUI</b> 
- <b>Cocoapods</b>
- <b>Firebase</b>

<h2>App Architecture Walk-Through:</h2>

- The MUSEUM app uses the MVVM design:

<br/>
<img width="273" alt="MVVM" src="https://github.com/stellalo/Museum2022/assets/89308696/5f53cf09-547f-4bf7-8890-93d16a34cd8f">

<br/>
<br/>

- This is the model of the MUSEUM app:

<br/>

```ruby
import Foundation
class Museum : Identifiable, Decodable, ObservableObject{
    //making it optional --> nil by default
    var id:UUID?
    var index:String
    var Name:String
    var Category:String
    var image:String
    var city:String
    var country:String
    var photo:[String]
    var date:String
    var address:String
    var director:String
    var visited:Bool
    var favorite:Bool
    var tovisit:Bool
    var introduction:String
    var url:String?
    var famous:[Collection]
}
class Collection: Identifiable, Decodable{
    var id: Int?
    var pic:String?
    var name:String?
    var artist:String?
    var date2:String?
    var material:String?
    var location:String?
}
```

<br/>

<p align="center">
<b>Browse-by-City View:</b> <br/>
<img src="https://uploads-ssl.webflow.com/6258b5667d7c54ae3c98986b/6258dd3e7e75e6e411887a91_Screen%20Shot%202022-01-30%20at%2010.53.02%20AM.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>

<br/>
<br/>

- It has three main selection menu: Browse, Search, and Home.

```ruby
import SwiftUI

struct MuseumTabView: View {
    
    @EnvironmentObject var model:MuseumModel
    //@EnvironmentObject var viewModel:AppViewModel
    
    var body: some View {
        TabView{
            BrowseView().tabItem {
                Image(systemName: "book.circle.fill")
                Text("Browse")
            }
            ListView().tabItem {
                Image(systemName: "magnifyingglass.circle.fill")
                Text("Search")
            }
            UserHomeView().tabItem {
                Image(systemName: "person.crop.circle.fill")
                Text("Home")
            }
        }
    }
}

struct MuseumTabView_Previews: PreviewProvider {
    static var previews: some View {
        MuseumTabView().environmentObject(MuseumModel())
        //.environmentObject(AppViewModel())
    }
}
```

<br />
<br />
<img src="https://uploads-ssl.webflow.com/6258b5667d7c54ae3c98986b/6258e44cfcc890d2447ef511_Screen%20Shot%202022-04-14%20at%208.19.06%20PM.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />
<br />

- ViewModel of the MUSEUM app:

<br/>

```ruby
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
```
<img src="https://uploads-ssl.webflow.com/6258b5667d7c54ae3c98986b/6258e4951a33c22425d41bbb_Screen%20Shot%202022-04-14%20at%208.19.17%20PM.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />
<br />
