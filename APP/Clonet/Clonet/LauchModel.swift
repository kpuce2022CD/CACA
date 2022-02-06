typealias LaunchData = LaunchListQuery.Data.Launch

struct Launches: Decodable {
    var cursor : String
    var hasMore : Bool
    
    init(){
        self.cursor = ""
        self.hasMore = false
    }

}
