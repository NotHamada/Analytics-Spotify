include("Authentication.jl")
using JSON

function Search()
    body = Authenticate()

    access_token = body["access_token"]
    token_type = body["token_type"]
    expires_in = body["expires_in"]

    request = HTTP.get("https://api.spotify.com/v1/search?q=album%3Adrama+artist%3Aaespa&type=album",[
        "Authorization" => "$token_type $access_token"
    ])

    println(request.status)

    json = JSON.parse(String(request.body))

    albums = json["albums"]
    items = albums["items"]

    for item in items 
        println(item["images"])
    end
end

Search()