include("Login.jl")
using JSON
using HTTP

function Authenticate()
    request_body = Login()

    body = JSON.parse(request_body)

    access_token = body["access_token"]
    token_type = body["token_type"]
    expires_in = body["expires_in"]

    request = HTTP.get("https://api.spotify.com/v1/search?q=remaster%2520track%3ADoxy%2520artist%3AMiles%2520Davis&type=album",
    [
        "Authorization" => "$token_type $access_token"
    ])

    println(request.status)
    println(String(request.body))
end

Authenticate()