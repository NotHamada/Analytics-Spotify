using HTTP
using JSON

file = open("./keys.json", "r")
json = read(file, String)

keys = JSON.parse(json);

client_id = keys["client_id"]
client_secret = keys["client_secret"]

r = HTTP.post("https://accounts.spotify.com/api/token", 
    [
    "Content-Type" => "application/x-www-form-urlencoded"
    ],"grant_type=client_credentials&client_id=$client_id&client_secret=$client_secret")

println(r.status)
println(String(r.body))